//
//  ViewController.swift
//  Tipsy_bymyself
//
//  Created by 권현석 on 2022/12/19.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.00
    var numberOfPeople = 2
    var billTotal = 0.00
    var finalResult = "0.00"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let selectedTip = sender.currentTitle!
        let selectedTipMinusPercent = String(selectedTip.dropLast())
        let selectedTipInDouble = Double(selectedTipMinusPercent)!
        tip = selectedTipInDouble / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.finalPeople = numberOfPeople
            destinationVC.totalTip = Int(tip * 100)
            
            
        }
    }
    
}

