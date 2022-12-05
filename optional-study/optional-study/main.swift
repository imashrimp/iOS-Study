//
//  main.swift
//  optional-study
//
//  Created by 권현석 on 2022/12/05.
//

import Foundation

// 변수 myName의 type은 String?이고 이 변수에 “yagom”이 할당됨
var myName: String? = "yagom"

//옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 추출해서 할당해야 한다.
/*변수 yagom의 type은 String이다. 변수 yagom에는 forced unwrapped된 “yagom”이 할당되었다.
 왜냐하면 변수 yagom은 optional이 아니라서 10번 줄에 optional로 할당 되었던 변수myName을 forced unwrapped 해주어 value “yagom” 할당*/
var yagom: String = myName!

myName = nil
yagom = myName!
//런타임 오류
