//
//  main.swift
//  switch-statement-numberAndDay
//
//  Created by 권현석 on 2022/11/30.
//

import Foundation

var aNumber =  Int(readLine()!
)!

func dayOfTheWeek(day: Int) {
  
    switch aNumber {
    case 1:
        print("Monday")
    case 2:
        print("Tuesday")
    case 3:
        print("Wednesday")
    case 4:
        print("Thursday")
    case 5:
        print("Friday")
    case 6:
        print("Saturday")
    case 7:
        print("Sunday")
    default:
        print("Error")
    }
  
  
}

dayOfTheWeek(day: aNumber)
