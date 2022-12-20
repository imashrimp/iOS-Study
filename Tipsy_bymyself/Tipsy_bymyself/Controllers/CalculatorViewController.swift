//
//  ViewController.swift
//  Tipsy_bymyself
//
//  Created by 권현석 on 2022/12/19.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var buttonSelected: Float = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //        아래 네 줄이 버튼 눌렀을 때 그 버튼의 바탕에 불 들어오는 코드
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        var buttonPressed = sender.currentTitle
        if buttonPressed == "0%" {
            buttonSelected = 0.0
        }else if buttonPressed == "10%" {
            buttonSelected = 0.1
        }else if buttonPressed == "20%" {
            buttonSelected = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(buttonSelected)
        print(splitNumberLabel.text!)
    }
}

