//
//  main.swift
//  dictionary-exercise
//
//  Created by 권현석 on 2022/12/04.
//

import Foundation

func exercise() {

    //Don't change this
    var stockTickers: [String: String] = [
        "APPL": "Apple Inc",
        "HOG": "Harley-Davidson Inc",
        "BOOM": "Dynamic Materials",
        "HEINY": "Heineken",
        "BEN": "Franklin Resources Inc"
    ]
    
    //Write your code here.
   /* stockTickers["WORK"] = "Slack Technologies Inc"
    stockTickers["BOOM"] = "DMC Global Inc"
   */
    
    stockTickers.updateValue("Slack Technologies Inc", forKey: "WORK")
    stockTickers.updateValue("DMC Global Inc", forKey: "BOOM")
  
     //Don't modify this
    print(stockTickers["WORK"]!)
    print(stockTickers["BOOM"]!)
}
 
exercise()
