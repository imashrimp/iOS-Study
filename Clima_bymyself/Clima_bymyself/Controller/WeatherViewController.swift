//
//  ViewController.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/22.
//

import UIKit
import CoreLocation


/*
 (Protocol)UITextFieldDelegate => text field에 입련된 text를 편집, 관리 확인하는 optional method이다.
 */
class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        아래 코드가 locationManager.requestLocation() 보다 아래에 있으면 error가 생긴다. => 왜? 이유가 뭔데?
        locationManager.delegate = self
//아래 코드는 gps 사용 허가창 띄우는 용도
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
      
        //        아래의 코드는 Weather Manager에서 peformRequest 메서드의 역할을 viewController에서 볼 수 있도록 하는 것이다. 즉, Weather Mananger certificate의 bleep를 veiw controller가 갖는 것을 의미한다.
        weatherManager.delegate = self
        /*
         user가 text field에 입력했을 때 text field가 VC에게 무슨일이 생겼는지 알린다
         여기서 무슨일은
         1. 유저가 타이핑 시작 or 멈춤
         2. 유저가 text field외의 부분을 tap했을 때 deselect text field 해야하는지 물어보는 것 등이 있다.
         => 즉 text field로 하여금 지금 무슨일이 일어나는지 알릴 수 있게 한다.
         */
        searchTextField.delegate = self
    }
     
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation() 
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        
        searchTextField.endEditing(true)
        //        searchTextField.text를 느낌표(!)로 언래핑하는 이유는 textfield가 빈 상태로 값을 전달 할 수 있기 때문에 searchTextField.text는 optional 값이기 때문이다.
        print(searchTextField.text!)
    }
    
    //    아래 메서드는 delegate에 'return' 버튼이 눌렸을 때 text field가 무언가를 해야하는지 물어보게 한다. 그리고 아래의 메서드는 return 버튼에 대한 IBAction과 같다.
    /*
     위의 UITextFieldDelegate, searchTextField.delegate = self로 아래 메서드를 만들고 이 메서드는 delegate(현재 class)에 text field가 button pressed의 과정을 처리해야하는지 묻는다.
     => text field: "VC야 유저가 return키를 눌렀는데 뭘 할까?"
     이 순간이 'return'버튼이 눌린 순간이다.
     ⭐️ search button 이나 go를 누르면 text field에 입련된 값을 받을 수 있다.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    /*
     아래 메서드는 유전가 text field에 입력한 걸 확인하기 좋다. 여기서 return이 true이면, 키패드를 없애고, false이면 키패드를 유지하고 "Type someting"을 text field에 띄운다. textField.text에 있는 textfield는 우리가 특정된 textfield가 아닌데 이는 parameter이다.
     특정할 필요가 없는 textfield를 parameter를 사용해서 현재 VC에 있는 아무 text field에 적용한다.
     */
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something!"
            return false
        }
    }
    
    /*
     아래 메서드는 text field에 입력이 끝나면 작동한다. 이는 go, search 버튼이 작동하면 text field를 원 상태(빈칸 or Search)로 돌린다.
     이 메서드는 반복을 줄이기 위함인데 이 메서드가 없으면 searchPressed, textFieldShouldReturn 메서드에 textField.text != ""가 각각 있어야한다.
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //        if let은 optional을 unwrap하기 위함이다.
        if let city = searchTextField.text {
            //            WeatherManager에서 fetchWeather 메서드의 cityName에 text field에 입력된 도시 이름을 가져오기 위한 impement이다.
            weatherManager.fetchWeather(cityName: city)
        }
        
        
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        //        아래의 DispatchQueue는 날씨 데이터를 불러오는건 background에서 이뤄지기 때문에 시간이 걸리는데 이때 app 사용자는 app이 멈췄다고 느낄 수 있다 그래서 아래의 메서드를 작성해주는 것이고 '{}'안의 self는 closure라서 써주는 것이다.
//        weather.는 Weather Model에서 오는건데 왜지?
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    } 
    
    func didFailWithError(error: Error) {
        print(error )
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        위의 메서드에서 locations parameter가 위치정보를 받아오고, 이는 array이기 때문에 .last가 가장 최근에 받아온 위치정보를 가져오게 한다. 그리고 location이 optional이라 binding을 해준다.
        if let location = locations.last {
//            위치버튼을 누르면 내가 있는 위치의 날씨정보를 받아오기 위해서는 앱이 작동되었을 때나 위치버튼을 눌렀을 때 위치정보를 새로 받아오는 걸 멈춰야한다. 이를 위해 아래의 코드 한 줄이 필요하다.
            locationManager.stopUpdatingHeading()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error )
    }
}
