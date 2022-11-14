// 유클리드 호제법
// gcd(a, b) == gcd(b, a % b)
import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        return a % b == 0 ? b : gcd(b, a % b)
    }
    
    var gcdA = arrayA[0]
    for a in arrayA[1...] {
        gcdA = gcd(gcdA, a)
    }
    
    var gcdB = arrayB[0]
    for b in arrayB[1...] {
        gcdB = gcd(gcdB, b)
    }
    
    var result = 0
    if arrayB.allSatisfy({ $0 % gcdA != 0 }) {
        result = max(result, gcdA)
    }
    if arrayA.allSatisfy({ $0 % gcdB != 0 }) {
        result = max(result, gcdB)
    }
    return result
}
