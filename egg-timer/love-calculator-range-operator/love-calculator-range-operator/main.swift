//
//  main.swift
//  love-calculator-range-operator
//
//  Created by 권현석 on 2022/11/30.
//

import Foundation

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    switch loveScore {
    case 81...100:
        print("You love each other like Kanye loves Kanye.")
    case 41..<81:
        print("You go together like Coke and Mentos.")
    case ...40:
        print("You'll be forever alone.")
    default:
        print("Error loveScore is out of range .")
    }
    
    if loveScore > 80 {
        print("You love each other like Kanye loves Kanye.")
    }else if loveScore > 40 {
        print("You go together like Coke and Mentos.")
    }else {
        print("You'll be forever alone.")
    }
}
