//
//  WeatherManager.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/29.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0e6e6e952dc0bc49af8b3e8f009c98d7&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //        1. Create a URL
        
        if let url = URL(string: urlString) {
            //        2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //        3. Give the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    //closure 내부에서는 현재 클래스를 가리키는 메서드라도 self를 붙인다.
                    if let weather = self.parseJSON(weatherData: safeData ) {
//                        이게 closure 안에 있다고 하는데 closure가 어디서부터 시작하는거지?
                        self.delegate?.didUpdateWeather(weather: weather )
                    }
                }
            }
            
            //        4. Start the task
            //           resume()는 새로 이니셜라이징 된 업무는 지연된 상태로 시작하는데, 그 업무를 시작하기 위해서는 resume() 메서드가 필요하다.
            task.resume()
        }
        
    }
    func parseJSON(weatherData: Data)-> WeatherModel?  {
        let decoder = JSONDecoder()
        do {
            //        WeatherData 자리는 data type이 들어가는데 WeatherData.self를 함으로써 WeatherData는 object에서 data type이 된다.
            //            decode 메서드가 throw를 하는데, 이는 데이터가 JSON이 아닌 경우 오류를 throw함을 의미한다.
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //            decodedData의 data type이 Weatherdata라서 이는 name property를 받아올 수 있다.
            print(decodedData.main.temp)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
             
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
    
}
