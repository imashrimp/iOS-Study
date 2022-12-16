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
        print(String(format: "%.0f", sender.value))
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    
    
    
}

