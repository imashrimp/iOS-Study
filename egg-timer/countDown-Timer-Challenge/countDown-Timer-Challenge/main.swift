//
//  main.swift
//  countDown-Timer-Challenge
//
//  Created by κΆνμ on 2022/12/06.
//

import Foundation

var timer = 60

var clock = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)

func countdown() {
    timer--
}
