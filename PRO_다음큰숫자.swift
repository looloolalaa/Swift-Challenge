// binary rep
import Foundation

func solution(_ n:Int) -> Int {
    func oneCount(_ n: Int) -> Int {
        var counter = 0
        for c in String(n, radix: 2) {
            if c == "1" { counter += 1 }
        }
        return counter
    }
    
    let a = oneCount(n)
    for i in (n+1...1_000_000) {
        if a == oneCount(i) {
            return i
        }
    }
    return -1
}
