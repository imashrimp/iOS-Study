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
    
//    computed property
    var conditionName = String {
        return
    }
    
 
    
    func getConditionName(weatherId: Int)-> String {
        //          switch statement를 써서 Int에 맞는 String을 뽑아내고 그 값으로 위의 parseJSON 메서드를 실행했을 때 openweathermap에서 표시된 숫자에 맞는 날씨 기호에 맞게 storyboard에 도형의 이름을             print(getConditionName(weatherId: id))로 뽑아내자
        switch weatherId {
        case 200 ... 232:
            return "could.bolt"
        case 300 ... 321, 520 ... 513:
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
