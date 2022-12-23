//
//  ViewController.swift
//  Clima_bymyself
//
//  Created by 권현석 on 2022/12/22.
//

import UIKit


/*
 (Protocol )UITextFieldDelegate => text field에 입련된 text를 편집, 관리 확인하는 optional method이다.
 */
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         user가 text field에 입력했을 때 text field가 VC에게 무슨일이 생겼는지 알린다
         여기서 무슨일은
         1. 유저가 타이핑 시작 or 멈춤
         2. 유저가 text field외의 부분을 tap했을 때 deselect text field 해야하는지 물어보는 것 등이 있다.
         => 즉 text field로 하여금 지금 무슨일이 일어나는지 알릴 수 있게 한다.
         */
        searchTextField.delegate = self
    }
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        searchTextField.endEditing(true)
        //        searchTextField.text를 느낌표(!)로 언래핑하는 이유는 textfield가 빈 상태로 값을 전달 할 수 있기 때문에 searchTextField.text는 optional 값이기 때문이다.
        print(searchTextField.text!)
    }
    
    /*
     위의 UITextFieldDelegate, searchTextField.delegate = self로 아래 메서드를 만들고 이 메서드는 delegate(현재 class)에 text field가 button pressed의 과정을 처리해야하는지 묻는다.
     => text field: "VC야 유저가 return키를 눌렀는데 뭘 할까?"
     이 순간이 'return'버튼이 눌린 순간이다.
     ⭐️ search button 이나 go를 누르면 text field에 입련된 값을 받을 수 있다.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    /*
     아래 메서드는 유전가 text field에 입력한 걸 확인하기 좋다. 여기서 return이 true이면, 키패드를 없애고, false이면 키패드를 유지하고 "Type someting"을 text field에 띄운다. textField.text에 있는 textfield는 우리가 특정된 textfield가 아닌데 이는 parameter이다.
     특정할 필요가 없는 textfield를 parameter를 사용해서 현재 VC에 있는 아무 text field에 적용한다.
     */
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something!"
            return false
        }
    }
    
    /*
     아래 메서드는 text field에 입력이 끝나면 작동한다. 이는 go, search 버튼이 작동하면 text field를 원 상태로 돌린다.
     이 메서드는 반복을 줄이기 위함인데 이 메서드가 없으면 searchPressed, textFieldShouldReturn 메서드에 textField.text != ""가 각각 있어야한다.
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
    
}


