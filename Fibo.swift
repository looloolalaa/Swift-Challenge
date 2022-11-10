//
//  Fibo.swift
//  challenge
//
//  Created by Kihyun Lee on 2022/11/09.
//

import Foundation

// recursive & bottomUp & topDown
func fibo() {
    var fibo: [Int] = [0, 1]
    
    func f(_ n: Int) -> Int {
        if n <= 1 { return n }
        return f(n-2) + f(n-1)
    }
    
    func bottomUp(_ n: Int) -> Int {
        if n < fibo.count { return fibo[n] }
        fibo.append(fibo[fibo.count - 2] + fibo[fibo.count - 1])
        return bottomUp(n)
    }
    
    func topDown(_ n: Int) -> Int {
        if n < fibo.count { return fibo[n] }
        fibo.append(topDown(n-2) + topDown(n-1))
        return fibo[n]
    }
    
    print(topDown(60))
}
