//
//  StoryBrain.swift
//  Destini_byMyself
//
//  Created by 권현석 on 2022/12/15.
//

import Foundation

struct StoryBrain {
    
    var storyNumber = 0
    
//    choiceDestination = 0이 질문지가 무한루프하게 함.
    let stories = [
        Story(t: "You see a fork in the road", c1: "take a left", c2: "Take a right", c1d: 1, c2d: 2),
        Story(t: "You see a tiger", c1: "Shout for help", c2: "Play dead", c1d: 0, c2d: 0),
        Story(t: "You find a treasure", c1: "Open it", c2: "check for traps", c1d: 0, c2d: 0)
    ]
    
    func getStoryTitle() -> String {
        return stories[storyNumber].title
    }
    
    func getChoice1() -> String {
        return stories[storyNumber].choice1
    }
    
    func getChoice2() -> String {
        return stories[storyNumber].choice2
    }
    
    mutating func nextStory(userChoice: String) {
        if userChoice == stories[storyNumber].choice1 {
            storyNumber = stories[storyNumber].choice1Destination
        }else {
            storyNumber = stories[storyNumber].choice2Destination
        }
    }
    

}

