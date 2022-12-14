//
//  AppDelegate.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
     
    let eggTimes = ["Soft": 3 , "Medium": 240, "Hard": 420]
    
    var timer =  Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
         
        
//invalidate는 timer 재가동 마다 timer를 멈춘다
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        /*
        버튼 탭에 의한 한 가지 수행을 마치고 초기화 하기 위한 작업
         */
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        /*
         Parametet Explanation
         timeInterval: "how often do you want the timer to fire?"
         repeats: "do you want to repeat the timer?" we don't want the timer to stop after a sec
         selector: remnant stuff from objective-c, but it means to call a func we put in.
         */
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
/*
 progress attribute가 Float unit이다. 그래서 secondsPassed / totalTime 하기 전 각각을 Float unit으로 바꿔줘야 한다. 다른 방법으로는 secondsPassed, totalTime을 변수 선언 할 때 Float unit으로 설정하는 방법이 있다.
 */
             
        }else {
            timer.invalidate()
            titleLabel.text = "DONE"
            
//let url은 오디오 파일 가져오는 것
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
//try는 함수에서 발생한 오류를 함수 호출한 코드에서 받기 위함이고 오류처리를 하기 위함임.
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
}
