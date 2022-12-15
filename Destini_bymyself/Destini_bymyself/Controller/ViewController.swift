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
    
    var storyNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    //        상수 example 안의 값을 가져오는 것이라 example.smth으로 값을 불러온다.
    
    // Do any additional setup after loading the view.
    
    
    @IBAction func choiceMade(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle
        let makeDirection = stories[storyNumber][1]
        
        if userChoice == makeDirection {
            storyNumber += 1
            storyLabel.text = stories[storyNumber][0]
            choice1Button.setTitle(stories[storyNumber][1], for: .normal)
            choice2Button.setTitle(stories[storyNumber][2], for: .normal)
        }else {
            storyNumber += 2
            storyLabel.text = stories[storyNumber][0]
            choice1Button.setTitle(stories[storyNumber][1], for: .normal)
            choice2Button.setTitle(stories[storyNumber][2], for: .normal)
        }
        
//        storyNumber  += 1
        updateUI()
        // story0에서 "Take a left" 골랐을 때, story1 "You see a tiger"가 나올 수 있게 하자
        /*
         
         mutating func nextStory(userChoice: String) {
         
         let currentStory = stories[storyNumber]
         if userChoice == currentStory.choice1 {
         s toryNumber = currentStory.choice1Destination
         } else if userChoice == currentStory.choice2 {
         storyNumber = currentStory.choice2Destination
         }
         }
         */
        
        /*
         if sender.currentTitle == stories[0][1] {
         storyLabel.text = stories[1][0]
         */
        
    }
    func updateUI() {
        storyLabel.text = stories[storyNumber][0]
        choice1Button.setTitle(stories[storyNumber][1], for: .normal)
        choice2Button.setTitle(stories[storyNumber][2], for: .normal)
    }
}

