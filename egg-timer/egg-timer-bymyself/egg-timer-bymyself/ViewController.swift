//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        if sender.currentTitle = softTime {
            print(5)
        }else if sender.currentTitle = mediumTime {
            print(7)
        }else {
            print(12)
        }
        
}
