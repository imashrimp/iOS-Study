//
//  CoinManager.swift
//  ByteCoin_bymyself
//
//  Created by 권현석 on 2023/01/06.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "9A12CFEA-F64B-4AC9-B0A9-358F7A79A739"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
//    clima와 다르게 여기서는 fetch메서드를 따로 사용하지 않는 이유가 있는가? => api를 통해 data를 받아와 실행되는 함수에 networking이 필요하다. 현재 step3에서는 getCoinPrice 메서드에서만 api networking을 통해 받은 data를 사용하므로 여기에 networking과정이 사용된다.
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                let dataAsString = String(data: data!, encoding: .utf8)
            }
            task.resume()
            
        }
        
    }
}
