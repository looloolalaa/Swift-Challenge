//
//  BOJ_전화번호목록.swift
//  challenge
//
//  Created by Kihyun Lee on 2022/11/17.
//

// sort & [i+1].hasPrefix([i])
import Foundation


func main_sort() {
    var results: [String] = []
    for _ in (0..<Int(readLine()!)!) {
        let n = Int(readLine()!)!
        var strings = (0..<n).map { _ in readLine()! }
        
        strings.sort()
        results.append(((0..<n-1).allSatisfy { i in
            !strings[i+1].hasPrefix(strings[i])
        }) ? "YES" : "NO")
    }
    for r in results { print(r) }
}


