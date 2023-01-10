//
//  ViewController.swift
//  ByteCoin_bymyself
//
//  Created by 권현석 on 2023/01/06.
//

import UIKit

//UIPickerViewDelegate는 pickerView의 항목 이름 수정과 interaction을 찾기위함이다.
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    let coinManager = CoinManager()
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ViewController를 data source로 쓰기위한 코드
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }

//    이 메서드는 pickerView를 스크롤 다운 or 업 하면 작동하고, 그때마다 선택된 row number를 받아온다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
    
}

