//
//  main.swift
//  print_highestScore
//
//  Created by 권현석 on 2022/12/04.
//

import Foundation

//Don't change this
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

func highestScore(scores: [String: Int]) {
    
    //Write your code here.
       var temp = 0
//   key를 사용해 value가 dictionary에서 나오면 value는 optional이다. 그래서 !를 붙여준다
    if scores["Amy"]! > scores["James"]!{
      temp = scores["Amy"]!
      } else {
      temp = scores["James"]!
      }

      if scores["Helen"]! > temp {
      temp = scores["Helen"]!
      print(temp)
      } else {
      print(temp)
      }
    }
