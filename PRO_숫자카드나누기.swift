// divisors
import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    func divisors(_ n: Int) -> [Int] {
        var result: [Int] = (1..<Int(sqrt(Double(n)) + 1)).filter { n % $0 == 0 }
        for d in result.reversed() {
            result.append(n / d)
        }
        return result
    }
    
    func isValid(_ d: Int) -> Bool {
        return (arrayA.allSatisfy { $0 % d == 0 } && arrayB.allSatisfy { $0 % d != 0 })
                || (arrayA.allSatisfy { $0 % d != 0 } && arrayB.allSatisfy { $0 % d == 0 })
    }
    
    let minA = arrayA.min()!
    let minB = arrayB.min()!
    var candis: Set<Int> = Set(divisors(minA)).union(Set(divisors(minB)))
    
    var maxDivisor = 0
    for d in candis {
        if isValid(d) {
            maxDivisor = max(maxDivisor, d)
        }
    }
    return maxDivisor
}


// 1 2 7 14

// 1 2 3 6 9 18

// 2000 * 100_0000
