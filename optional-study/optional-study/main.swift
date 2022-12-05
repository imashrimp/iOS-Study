//
//  main.swift
//  optional-study
//
//  Created by 권현석 on 2022/12/05.
//

import Foundation

var myName: String? = "yagom"

//옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 추출해서 할당해야 한다.
var yagom: String = myName!

myName = nil
yagom = myName!
//런타임 오류
