//
//  ViewController.swift
//  BMI Calculator bymyself
//
//  Created by 권현석 on 2022/12/16.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain() 
    
    
    
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
        
        calculatorBrain.calculate BMI(height: height, weight: weight)
//        segue를 실행하기 위한 메서드이고, withIdentifier는 segue의 이름, sender에는 이 segue를 실행하는 viewController를 넣어준다. 
     performSegue(withIdentifier: "goToResult ", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        아래의  은 segue가 작동했을 때, initialise된 viewController가 될 것이다
        if segue.identifier == "goToResult" {
//            destinationVC, destination의 타입은 UIViewConroller인데, bmiValue는 ResultController에만 있는거라 destionation이 ResultViewController를 가리키도록(narrow down) 하기 위해  as! ResultViewController를 사용한다. as는 UIViewController를 ResultViewController로  castdown하는 것이다.
            let destinationVC = segue.destination as! ResultViewController
//            왼쪽은 ResultViewController의 bmiValue이고, 오른쪽은 CalculateViewController의 bmiValue이다.
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
        }
    }
    
}

