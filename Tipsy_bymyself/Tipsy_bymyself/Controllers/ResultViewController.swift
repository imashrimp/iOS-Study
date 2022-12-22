//
//  ResultsViewController.swift
//  Tipsy_bymyself
//
//  Created by 권현석 on 2022/12/21.
//

import UIKit

class ResultViewController: UIViewController {

    
    
    var result = "0.0"
    var finalPeople = 2
    var totalTip = 10
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(finalPeople) people, with \(totalTip)% tip."

    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
