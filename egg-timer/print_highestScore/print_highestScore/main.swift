//
//  main.swift
//  print_highestScore
//
//  Created by 권현석 on 2022/12/04.
//

import Foundation
/*Don't change this 라고 되어있지만
 (readline()!)!을 Int로 바꿔야한다*/
var studentsAndScores = ["Amy": 88, "James": 99, "Helen": 100]

func highestScore(scores: [String: Int]) {
    
    //Write your code here.
//    values는 Dictionary의 value만 가져오게 하고, max는 구성요소 중 최대값을 가져온다
    let maxScore = studentsAndScores.values.max()

    print(maxScore!)

        }
//이 함수의 (scores: ["Amy : 88])의 역할을 잘 모르겠다
/*scores는 parameter이고 ["Amy" : 88]은 argument이다.
 이 function 정의를 func 함수이름(parameter name: parameter type) {}
 이렇게 했으므로 함수 호출 시 함수이름(parameter: argument)
 이 양식을 가져와야 한다.
 */
highestScore(scores: ["Amy" : 88])
