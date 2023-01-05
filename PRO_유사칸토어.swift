// 비트 하나하나 시간초과
// => 프랙탈 구조 규칙성 찾기
import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    func oneCount(_ n: Int, _ i: Int) -> Int {
        if n == 1 {
            return [1,1,0,1,1][..<i].filter { $0 == 1 }.count
        }
        
        let one = Int(pow(4, Double(n-1)))
        let block = Int(pow(5, Double(n-1)))
        var (div, rem) = (i/block, i%block)
        if div == 2 {
            return one * div
        } else if div > 2 {
            div -= 1
        }
        
        return one * div + oneCount(n-1, rem)
    }

    return oneCount(n, Int(r)) - oneCount(n, Int(l-1))
}


// 1 1 0 1 1

// 11011 11011 00000 11011 11011
//  4     4     5^1    4     4

// 16 16 (5^2) 16 16


