// dfs 모든 경우의 수 => + DP
import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = Array(numbers).map { Int(String($0))! }
    
    func dis(_ a: Int, _ b: Int) -> Int {
        if a == b { return 1 }
        let (ai, aj) = (a == 0) ? (3, 1) : ((a-1) / 3, (a-1) % 3)
        let (bi, bj) = (b == 0) ? (3, 1) : ((b-1) / 3, (b-1) % 3)
        
        if ai == bi || aj == bj { return 2 * (abs(ai-bi) + abs(aj-bj)) }
        
        let diff = [abs(ai-bi), abs(aj-bj)].sorted()
        return 3 * diff[0] + 2 * (diff[1] - diff[0])
    }
    
    var mindis: [[Int]: Int] = [:]
    func minDis(_ i: Int, _ l: Int, _ r: Int) -> Int {
        let key = [i, l, r]
        if let res = mindis[key] { return res }
        
        if i == numbers.count {
            mindis[key] = 0
        } else if numbers[i] == l || numbers[i] == r {
            mindis[key] = 1 + minDis(i+1, l , r)
        } else {
            let moveR = dis(numbers[i], r) + minDis(i+1, l, numbers[i])
            let moveL = dis(numbers[i], l) + minDis(i+1, numbers[i], r)
            mindis[key] = min(moveR, moveL)
        }
        return mindis[key]!
    }
    
    return minDis(0, 4, 6)
}
