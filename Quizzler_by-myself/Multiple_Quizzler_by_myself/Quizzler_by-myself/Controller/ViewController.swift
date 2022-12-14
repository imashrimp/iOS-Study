//
//  ViewController.swift
//  Quizzler_by-myself
//
//  Created by 권현석 on 2022/12/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var Choice1: UIButton!
    @IBOutlet weak var Choice2: UIButton!
    @IBOutlet weak var Choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        // this line means  output of the function checkAnswer
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight  {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestionAndAnswer()
        
        // repeat할 필요가 없으므로 false이고, egg-timer와 다르게 invalidate 할 이유가 없으므로 timer = Timer의 형태가 아님
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //    위의 #selector가 method인 updateUI를 가리키는데 이는 objective-c에 없으므로 아래의 func 앞에 @objc를 붙임
    @objc func updateUI()  {
        questionLabel.text = quizBrain.getQuestionText()
       
        let answerChoices = quizBrain.getAnswers()
        Choice1.setTitle(answerChoices[0], for: .normal)
        Choice2.setTitle(answerChoices[1], for: .normal)
        Choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        //        the way to back to the color of the buttons when we go to  the next question
        self.Choice1.backgroundColor = UIColor.clear
        self.Choice2.backgroundColor = UIColor.clear
        self.Choice3.backgroundColor = UIColor.clear
    }
    
}
