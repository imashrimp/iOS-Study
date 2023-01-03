//
//  WeatherManager.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/29.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0e6e6e952dc0bc49af8b3e8f009c98d7&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //        1. Create a URL
        
        if let url = URL(string: urlString) {
            //        2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //        3. Give the session a task/ 이 단계가 url을 따라가서 거기에 있는 데이터를 가져오는 단계이다. session이 url을 받아오고 task가 받아온 url에 접속해 그 데이터를 받아오면 closure가 동작한다.
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    여기는 error를 왜 unwrap하지?
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    //closure 내부에서 method를 call할 때 self.을 붙인다.
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //        4. Start the task
            //           resume()는 새로 이니셜라이징 된 업무는 정지된 상태로 시작하는데, 그 업무를 시작하기 위해서는 resume() 메서드가 필요하다. 이 단계는 'enter'키를 누르는 단계이므 로
            task.resume()
        }
        
    }
    
    //    weatherData parameter에 들어가는 data는 우리가 networking의 datatask를 통해 받아온 data이다.
    func parseJSON(_ weatherData: Data)-> WeatherModel?  {
        let decoder = JSONDecoder()
        do {
            //        WeatherData 자리는 data type이 들어가는데 WeatherData.self를 함으로써 WeatherData는 object에서 data type이 된다.
            // decode는 throw라는 키워드를 갖는데, 이는 error가 있을 수 있다는 것이고, error를 throw하기 위해 try와 do를 사용하며, throw한 error를 catch하는데 catch 키워드가 사용된다.
            //           decode 메서드는 output을 갖는데, 이를 let decodedData가 받는다.
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //            decodedData의 data type이 Weatherdata라서 이는 name property를 받아올 수 있다.
            print(decodedData.main.temp) 
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch {
//            여기는 왜 error를 unwrap 안 하지?
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
