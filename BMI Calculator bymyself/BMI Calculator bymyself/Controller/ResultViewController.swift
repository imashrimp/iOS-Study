//
//  ResultViewController.swift
//  BMI Calculator bymyself
//
//  Created by 권현석 on 2022/12/18.
//

import UIKit

class ResultViewController: UIViewController {
    
    // calculatorViewController에서 segue가 동작한 순간에  value를 아직 모르기 때문에 optional로 할당함.
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        Label은 등호(=) 뒤의 값이 optional이더라도 unwrapping을 안 해도  괜찮다. Label이 이를 알아서 처리한다.
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //        UIViewController의 method dismiss는 override에 있는걸 dismiss하고 calculate하기 전 상태로 돌려놓는다. 그리고 completion: nil에서 nil은 dismiss 이후 추가적으로 무언가를 실행 안 함을 나타낸다.
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
