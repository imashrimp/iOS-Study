//
//  WeatherManager.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/29.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0e6e6e952dc0bc49af8b3e8f009c98d7&units=metric"
    
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
            
            let task = session.dataTask(with: url, completionHandler: handle(data:resoponse:error:) )
            
//        4. Start the task
//           resume()는 새로 이니셜라이징 된 업무는 지연된 상태로 시작하는데, 그 업무를 시작하기 위해서는 resume() 메서드가 필요하다.
            task.resume()
        }
        
    }
    
    func handle(data: Data?, resoponse: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString )
        }
    }
    
}
