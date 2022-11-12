//
//  BOJ_이진수연산.swift
//  challenge
//
//  Created by Kihyun Lee on 2022/11/11.
//

import Foundation

// 2**N: too big
func binaryOperation() {
    let a = Array(readLine()!)
    let b = Array(readLine()!)
    let n = a.count

    print(String((0..<n).map { i in
        (a[i] == "1" && b[i] == "1") ? "1" : "0"
    }))

    print(String((0..<n).map { i in
        (a[i] == "1" || b[i] == "1") ? "1" : "0"
    }))

    print(String((0..<n).map { i in
        (a[i] != b[i]) ? "1" : "0"
    }))

    print(String((0..<n).map { i in
        (a[i] == "0") ? "1" : "0"
    }))

    print(String((0..<n).map { i in
        (b[i] == "0") ? "1" : "0"
    }))
}
