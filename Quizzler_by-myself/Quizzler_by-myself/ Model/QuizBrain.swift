//
//  QuizBrain.swift
//  Quizzler_by-myself
//
//  Created by 권현석 on 2022/12/13.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        /*
         just before using structure i used 2D array
         ["Four + Two is equal to Six", "True"],
         ["Five - Three is greater than One", "True"],
         ["Three + Eight is less than Ten", "False"]
         */
    ]
    // 이건 quiz로 하는걸 트래킹하기 위함
    var questionNumber = 0
    var score = 0
    
    
    // 이 method는 QuizBrain struct의 property(questionNumber)를 바꾸므로 mutating func으로 선언함.
    mutating  func nextQuestion() {
        if questionNumber + 1 < quiz.count  {
            questionNumber += 1
        }else {     //else는 퀴즈 초기화 위함
            questionNumber = 0
            score = 0
        }
    }
    
    //        questionLabel.text = quiz[questionNumber].text
    //    퀴즈를 순서대로 바꾸는 method
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // 정답 맞추고 스코어 기록 method
    mutating func checkAnswer(_ userAnswer: String) -> Bool  {
        // inside parameter name is used inside of a function and external parameter name is used when we call the function
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }else {
            return false
        }
    }
    
    // ProgressionBar 채우는 method
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    //    스코어 output위한 method
    func getScore() -> Int {
        return score
    }
    
    
}
