//
//  Question .swift
//  Quizzler_by-myself
//
//  Created by 권현석 on 2022/12/13.
//

import Foundation

struct Question {
    let text : String
    let answer:  String
    
    init(q: String, a:String ) {
        text = q
        answer = a 
    }
}
