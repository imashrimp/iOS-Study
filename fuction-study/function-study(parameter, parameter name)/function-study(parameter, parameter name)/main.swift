//
//  main.swift
//  function-study(parameter, parameter name)
//
//  Created by 권현석 on 2022/12/06.
//

import Foundation

func sayHello(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello '(name)!" + " "
    }
    return result
}

func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}


//함수 호출 시 argument label을 사용해 호출한다. => argument label: parameter,
print(sayHello(to: "Chope", 2))
print(sayHello(to: "Chope", repeatCount: 2))
