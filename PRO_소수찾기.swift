// 에라토스테네스의 체
import Foundation

func solution(_ n:Int) -> Int {
    var isPrime: [Bool] = Array(repeating: true, count: n+1)
    isPrime[0] = false
    isPrime[1] = false
    
    for i in 2..<Int(sqrt(Double(n)) + 1) {
        if isPrime[i] {
            var m = 2*i
            while m <= n {
                isPrime[m] = false
                m += i
            }
        }
    }
    return (2...n).filter { isPrime[$0] }.count
}
