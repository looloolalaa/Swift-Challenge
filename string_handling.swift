//
//  string_handling.swift
//  challenge
//
//  Created by Kihyun Lee on 2022/09/27.
//

import Foundation

// string index offset
func string_handling() {
    let str: String = "abc4k"
    let centerIndex = str.index(str.startIndex, offsetBy: 2)
    print(str[centerIndex])
}
