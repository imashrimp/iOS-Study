#Review

##WeatherViewController

###class WeatherViewController: UIViewController

[WeatherViewController]에서 
'var weatherManager = WeatherManager()'는 [WeatherManager]의 코드를 weatherManger로 이니셜라이징해 [WeatherViewController]에 가져오게 한다.
'let locationManager = CLLocationManager()'는 사용자의 위치정보를 받아오기 위함이다.

⭐️ let textField = TextField(), textField.delegate = self, var delegate = UITextFieldDelegate  
'something.delegate = self'는
'something'이 신호를 보내는 대상이 위의 코드를 가지는 class(즉, 현재 class)로 설정함을 뜻함.
위와 같이 설정해 'var delegate = another' 가진 class, structure가 가진 메서드를 현재 class가 수행하도록 함.
⭐️

viewDidLoad 메서드 내부에 있는 코드
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
13번은 locationManager에 할당된 class가 보내는 신호를 현재 class(=[WeatherViewController])가 받음을 의미
14번은 locationManager에 할당된 class가 갖는 메서드로써 app에서 사용자의 위치정보를 받기 전에 사용자의 허락을 받기위한 코드
15번은 locationManager에 할당된 class가 갖는 메서드로써 사용자의 위치정보를 받아오기 위한 메서드

        weatherManager.delegate = self
=> WeatherManger class에서 보내는 신호를 현재 class가 받음을 의미

        searchTextField.delegate = self
 => UITextField class에서 보내는 신호를 현재 class가 받음을 의미       


    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation() 
    }
=> locatioin 버튼이 눌렸을 때 사용자의 위치정보를 받아와 그 날씨를 표현하기 위함


-----------------------------------------------------------------------------------------------
###extension WeatherViewController: UITextFieldDelegate

    extension WeatherViewController: UITextFieldDelegate
=> extension은 이미 존재하는 class, structure의 functionality에 기능을 추가 할 때 사용한다. 그리고 이를 delegate별로 나누면 읽기 편한 코드가 된다.

        searchTextField.endEditing(true)
=> textField 외부를 탭 했을 때 키패드 창을 사라지게 한다. ()안의 값이 'true'인 경우 창을 내릴 것을 묻지 않는다.

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
=> 위의 메서드는 UITextFieldDelegate가 갖고 있는 메서드를 받아온 것이고, delegate(현재 class)에 텍스트 필드에 대한 Return(돌아가기) 버튼 누르기를 처리할지 여부를 묻습니다. True를 return하면 원래 하던 역할('return'버튼 처리여부 묻기)을 수행하고, false를 return하면 그 반대역할을 한다.

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something!"
            return false
        }
    }

=> 이 매서드는 textField에 입력된 값을 계속 수정할지 말지 물어보고 true를 return하면 수정을 멈추고 false를 return하면 계속 수정한다.
   그래서 아래 if구문에 textField가 빈칸이 아니면 true를 return, 빈칸이면 false를 return한다.
   
       func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
=> 현재 class에게 textField에 입력을 멈추라고 말한다. 'weatherManager.fetchWeather(cityName: city)'는 WeatherManager class에 있는 fetchWeather 메서드의 cityName에 text field에 입력된 도시 이름을 가져오기 위한 impement이다. 그리고 searchTextField.text = ""이 코드를 통해 textField를 쵝화 시켜준다.

-----------------------------------------------------------------------------------------------
###extension WeatherViewController: WeatherManagerDelegate

        extension WeatherViewController: WeatherManagerDelegate{}
=> 위의 class WeatherViewController: UIViewController에서 var weatherManager = WeatherManager()와 weatherManager.delegate = self를 통해 WeatherManager class의 신호와 메서드를 WeatherViewController가 받아올 수 있다.


    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
=> DispatchQueue는 날씨 데이터는 background에서 불러와서 시간이 걸리는데 이때 사용자는 app이 멈췄다고 느낄 수 있다. 그래서 아래의 메서드로 시간을  작성해주는 것이고 '{}'안의 self는 closure라서 써주는 것이다.
   또한 closure라 self를 붙여주고 'weather.' 뒤에 오는 temperatureString, conditionName, cityName은 WeatherModel structure의 property를 받아오는 것이고 이를 통해 화면의 온도, 날씨기호, 도시명을 바꿀 수 있다.
-----------------------------------------------------------------------------------------------
### [struct WeatherModel]

       temperature, conditionId, cityName 다음과 같은 세가지 property가 있고, 이 중 temperature를 화면에 표시하기 위해 String 이니셜라이저를 사용해 이를 String data type으로 변환한다. 그리고 conditionId를 switch 구문을 통해 범위에 따른 image의 title을 String data type으로 받아오고 이를 통해 날씨 기호를 바꿀 수 있다.
    
-----------------------------------------------------------------------------------------------
   
    func didFailWithError(error: Error) {
        print(error )
    }
=> 위의 메서드는 [WeatherManager]의 protocol에 'func didFailWithError(error: Error)'가 있기 때문이다.

-----------------------------------------------------------------------------------------------
### extension WeatherViewController: CLLocationManagerDelegate 

        extension WeatherViewController: CLLocationManagerDelegate {
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                if let location = locations.last {
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
        
=> ' func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                if let location = locations.last {'
    이 메서드의 'locations' parameter의 data type이 array로 되어 있으므로 그 아래 줄에서 'locations.last'를 통해 array의 마지막 배열을 받아온다.
    'locationManager.stopUpdatingHeading()' 이 코드는 앱이 작동되었을 때와 위치버튼을 눌렀을 때 사용자의 위치에 기반한 날씨정보를 받아외 위해 필요한 코드다.
    
    
-----------------------------------------------------------------------------------------------
###struct WeatherManager

        protocol WeatherManagerDelegate {
            func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
            func didFailWithError(error: Error)
        }

=> 위의 protocol로 인해 이를 adopt하는 [WeatherViewController]가 위의 두 메서드를 갖게한다.

        var delegate: WeatherManagerDelegate?
        
=> 위의 코드로 이 structure 내부에서 'delegate.'을 통해 'WeatherManagerDelegate'의 메서드를 사용 할 수 있다.

    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString) 
    }
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }

=> 'performRequest' 메서드로 api를 통해 날씨정보를 제공하는 웹사이트와 연결할 수 있다. 
    위의 두 'fetch'메서드로 url을 세팅하고 이를 [WeatherViewController]에 보내서 경위도, 도시이름에 기반해 날씨정보를 업데이트한다.
    
=> 'performRequest'은 networking을 위한 메서드이다. 여기에는 4단계가 있는데 
    1. create URL => 'if let url = URL(string: urlString)'이고 url을 받아온다. URL메서드가 String data type을 웹 브라우저와 연결한다.
    2. create URL Session => 'let session = URLSession(configuration: .default)'이고 이는 url을 우리가 브라우저에서 각 요소를 'Json View'의 형태로 보이게 한다
    3. Give URLSession a task =>  let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }이고 session을 통해 받아온 url을 통해 task 메서드가 작동하고 그 내부의 closure가 작동한다. closure 내부에서 'return'뒤에 아무것도 없는 이유는 closure가 원래는 'completionHandler'인데 이는 '()-> void'형태로 return을 하지 않는다. 그래서 여기서 return은 if 구문이 작동을 마침을 뜻한다.
            
    4. Start a task => task.resume()이고 task가 자동으로 실행되지 않으므로 'resume()'을 통해 실행시키다.
    
        func parseJSON(_ weatherData: Data)-> WeatherModel?  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
                    delegate?.didFailWithError(error: error)
            return nil
        }
    }

}

=> parseJSON 메서드는 JSON형태의 data를 해석하기 위함이다.
 parseJSON 메서드의 parameter data type은 'performRequest'의 3단계에 있는 closure의 input parameter인 'data'와 같다.
 'let decoder = JSONDecoder()'는 JSON형태의 파일을 decode하기 위함이다.
 'decoder.decode'에서 decode 메서드의 parameter 중 'WeatherData.self'는 structure인 'WeatherData'를 타입이로 만들기 위해 '.self'를 붙였고, 뒤의 'from: weatherData'는 encode 할 때 input type이다.
 그리고 decode 메서드는 error를 throw함으로 이를 위해 앞에 'try'를 붙이고 이를 do 안에 넣은 다음 이 메서드가 error를 던지면 'catch'를 사용해 error를 받아낸다.

-----------------------------------------------------------------------------------------------
###struct WeatherData: Codable


