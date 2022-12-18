//
//  CalculatorBrain.swift
//  BMI Calculator bymyself
//
//  Created by 권현석 on 2022/12/18.
//

import Foundation

struct CalculatorBrain {
    
//    calculateBMI에서 bmi 값을 가져오기 위한 변수
    var bmi: Float = 0.0
    
    
    mutating func calculateBMI(height: Float, weight: Float ) {
        bmi = weight / (height * height)
    }
     
    func getBMIValue() -> String  {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        return bmiTo1DecimalPlace
    }
    
}
