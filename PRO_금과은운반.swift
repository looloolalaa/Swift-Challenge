// 이진탐색
import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    let maxTime = (0..<t.count).map { (i: Int) in ((((g[i] + s[i]) / w[i]) + 1) * 2) * t[i] }.max()!
    // let maxTime = Int(2 * 10e9 * 10e5 * 2)
    
    func valid(_ time: Int) -> Bool {
        var (maxGold, maxSilver, maxSum) = (0, 0, 0)
        
        for i in 0..<t.count {
            let around = time / t[i]
            let c = (around + 1) / 2
            let maxAmount = w[i] * c
            
            let maxGo = (g[i] < maxAmount) ? g[i] : maxAmount
            let maxSi = (s[i] < maxAmount) ? s[i] : maxAmount
            let maxS = (g[i]+s[i] < maxAmount) ? g[i]+s[i] : maxAmount
            
            maxGold += maxGo
            maxSilver += maxSi
            maxSum += maxS
        }
        
        return a <= maxGold && b <= maxSilver && (a+b) <= maxSum
    }
    
    var (l, r) = (0, maxTime)
    while l <= r {
        let mid = (l + r) / 2
        if valid(mid) {
            r = mid - 1
        } else {
            l = mid + 1
        }
    }
    
    return Int64(l)
}
