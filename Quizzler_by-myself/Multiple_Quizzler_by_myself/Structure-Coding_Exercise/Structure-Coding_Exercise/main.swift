//
//  main.swift
//  Structure-Coding_Exercise
//
//  Created by 권현석 on 2022/12/13.
//

import Foundation

struct User {
    var name: String
    var email: String?
    var follwers: Int
    var isActive: Bool
    
    init(name: String, email: String? = nil, follwers: Int, isActive: Bool) {
/*
 self 공부 다시 해보자. self의 흐름
 => self뒤의 name은 structure의 name을 나타내고, 등호(=) 뒤의 name은 initdml 괄호() 안의 name을 나타낸다
 */
 
        self.name = name
        self.email = email
        self.follwers = follwers
        self.isActive = isActive
    }
    
    func logStatus()  {
        if isActive == true {
            print("\(name) is working hard")
        }else {
            print("\(name) has left earth")
        }
    }
}

var newUser = User(name: "Richard", follwers: 0, isActive: false)

