//
//  Weather Data.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/29.
//

import Foundation

struct WeatherData: Codable  {
    let name: String
    let main: Main
    let weather: [Weather]
}
 
struct Main: Codable {
    let temp: Double
}
struct Weather: Codable  {
    let id: Int 
}
