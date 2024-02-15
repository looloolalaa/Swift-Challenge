// 더블 링크드 리스트 LinkedList
import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var now = k
    var prv = Array(repeating: -1, count: n)
    for i in 1..<n {
        prv[i] = i-1
    }
    var nxt = Array(repeating: -1, count: n)
    for i in 0..<(n-1) {
        nxt[i] = i+1
    }
    
    func U(_ x: Int) {
        for _ in 0..<x {
            now = prv[now]
        }
    }
    
    func D(_ x: Int) {
        for _ in 0..<x {
            now = nxt[now]
        }
    }
    
    var stack: [Int] = []
    func C() {
        stack.append(now)
        if prv[now] != -1 {
            nxt[prv[now]] = nxt[now]
        }
        if nxt[now] != -1 {
            prv[nxt[now]] = prv[now]
        }
        
        if nxt[now] == -1 {
            now = prv[now]
        } else {
            now = nxt[now]
        }
    }
    
    func Z() {
        let z = stack.removeLast()
        if prv[z] != -1 {
            nxt[prv[z]] = z
        }
        if nxt[z] != -1 {
            prv[nxt[z]] = z
        }
    }
    
    for cm in cmd {
        let line = cm.components(separatedBy: " ")
        let c = line[0]
        if c == "U" {
            let x = Int(line[1])!
            U(x)
        } else if c == "D" {
            let x = Int(line[1])!
            D(x)
        } else if c == "C" {
            C()
        } else if c == "Z" {
            Z()
        }
    }
    
    var res = Array(repeating: "O", count: n)
    for i in stack {
        res[i] = "X"
    }
    return res.joined(separator: "")
}
