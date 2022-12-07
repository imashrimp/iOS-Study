//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
     
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    
    var secondsRemaining = 60
    
    var timer =  Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        /*
         Parametet Explanation
         timeInterval means "how often do you want the timer to fire?"
         repeats means "do you want to repeat the timer?" we don't want the timer to stop after a sec
         selector is kinda remnant stuff from objective-c, but it means to call a func we put in.
         */
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }else {
            timer.invalidate()
            titleLabel.text = "DONE"
        }
    }
    
    
}
