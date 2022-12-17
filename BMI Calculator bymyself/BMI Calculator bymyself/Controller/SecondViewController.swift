//
//  SecondViewController.swift
//  BMI Calculator bymyself
//
//  Created by 권현석 on 2022/12/17.
//

import UIKit

class SecondViewController : UIViewController {
    
    var bmiValue = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        새 ViewController를 만들 때 view는 투명하게 만들어진다 그래서 background에 색을 입혀준다.
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
//        addSubview는 부모view에 새 view를 추가한다. child view는 괄호 안의 'label'이다.
        view.addSubview(label)
        
        
    }
}
