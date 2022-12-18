//
//  ResultViewController.swift
//  BMI Calculator bymyself
//
//  Created by 권현석 on 2022/12/18.
//

import UIKit

class ResultViewController: UIViewController {
    
    var  bmiValue: String?
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue  
        
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
