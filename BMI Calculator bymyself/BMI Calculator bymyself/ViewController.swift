//
//  ViewController.swift
//  BMI Calculator bymyself
//
//  Created by 권현석 on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        /*
         String(format: "%.2f" , '내가 앞의 format으로 만들려는 값')
         이 메소드는 가져오는 값의 소수점 자릿수를 제한할 수 있게하고, "%/2f"는 소수점 두 자리만 가져오게 하는 format이다.
         여기서 f 앞의 숫자가 소수점 자리수를 의미한다.
         */
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
//        power function -> pow(a, b)이는 a^b를 만들어 낼 수 있다.
        let bmi = (weight / pow(height, 2)) 
        print(bmi)
    }
    
    
    
}

