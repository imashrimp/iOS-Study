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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //    입력된 버튼과 그 정답 여부에 따라 버튼의 색깔을 초록색 또는 빨간색으로 바꾸는 역할
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        // this line means  output of the function checkAnswer
        var userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight  {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        // repeat할 필요가 없으므로 false이고, egg-timer와 다르게 invalidate 할 이유가 없으므로 timer = Timer의 형태가 아님
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //    위의 #selector가 method인 updateUI를 가리키는데 이는 objective-c에 없으므로 아래의 func 앞에 @objc를 붙임
    @objc func updateUI()  {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        //        the way to back to the color of the buttons when we go to  the next question
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
        
        
    }
    
}
