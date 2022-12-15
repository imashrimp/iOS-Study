//
//  ViewController.swift
//  Destini_byMyself
//
//  Created by 권현석 on 2022/12/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let stories = [
        ["You see a fork in the road.", "Take a left.", "Take a right."],
        ["You see a tiger.", "Shout for help.", "Play dead."],
        ["You find a treasure chest.", "Open it.", "Check for traps."]
    ]
    
    //let example = Story(title: "You see a fork in the road", choice1: "Take a left", choice2: "Take a right")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        상수 example 안의 값을 가져오는 것이라 example.smth으로 값을 불러온다.
        storyLabel.text = example.title
        choice1Button.setTitle(example.choice1, for: .normal)
        choice2Button.setTitle(example.choice2, for: .normal)
        // Do any additional setup after loading the view.
    }
}
