//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*let softTime = 5
    let mediumTime = 7
    let hardTime = 12*/
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        /*switch hardness  {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        default:
            print(hardTime)
        }*/ //switch statement 사용 시
        
        if sender.currentTitle == "Soft"{
            print("Soft")
        }else if sender.currentTitle == "Medium" {
            print("Medium")
        }else {
            print("Hard")
        }
      
        
    }
}
