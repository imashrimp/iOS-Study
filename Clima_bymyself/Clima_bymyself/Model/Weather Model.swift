//
//  Weather Model.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/30.
//

import Foundation

struct WeatherModel {
    
//    아래 세 properties는 stored property라 불린다. 말 그대로 값을 store하고 있기 때문이다.
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
//    아래의 property는 comp uted property라 불리고 이 property가 output or return해야하는 값을 {}안에 있는  return 뒤에 적어준다.
    var conditionName: String {
          switch conditionId  {
        case 200 ... 232:
            return "could.bolt"
        case 300 ... 321:
            return "cloud.drizzle"
        case 500 ... 531:
            return "cloud.rain"
        case 600 ... 622:
            return "cloud.snow"
        case 701 ... 781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801 ... 804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
