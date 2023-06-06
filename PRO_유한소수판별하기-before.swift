// 기약분수(서로소) == gcd로 나누기
// 소인수 구하기 == 2..<(n+1) 중 나누어 지는 걸로 끝까지 나누기
import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 { return b }
        return gcd(b, a % b)
    }
    
    var b = b / gcd(a,b)
    
    var primes: [Int] = []
    for i in 2..<(b+1) {
        while b % i == 0 {
            primes.append(i)
            b /= i
        }
    }
    // print(primes)
    
    return (Set(primes).allSatisfy { $0 == 2 || $0 == 5 }) ? 1 : 2
}
