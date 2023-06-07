// 소인수들 구하기
import Foundation

func solution(_ n:Int) -> [Int] {
    var n = n
    var result: [Int] = []
    for i in 2..<(n+1) {
        while n % i == 0 {
            result.append(i)
            n /= i
        }
    }
    
    return Array(Set(result)).sorted()
}
