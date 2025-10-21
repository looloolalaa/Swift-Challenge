// 중복조합 [0,0,0,0]에 3배분하기 4H3
import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    func diff(_ table: [Int]) -> Int {
        var (aScore, rScore) = (0, 0)
        for i in 0...10 {
            if info[i] == 0 && table[i] == 0 { continue }
            
            if info[i] >= table[i] {
                aScore += 10-i
            } else {
                rScore += 10-i
            }
        }
        return rScore - aScore
    }
    
    var ans = -1
    var ansArr = [0,0,0,0,0, 0,0,0,0,0, 0]
    
    var arr = [0,0,0,0,0, 0,0,0,0,0, 0]
    func dfs(_ i: Int, _ cnt: Int) {
        if i == 0 {
            arr[0] = cnt
            
            let d = diff(arr)
            if d >= 1 && ans < d {
                ans = d
                ansArr = arr
            }
            
            arr[0] = 0
            return
        }
        
        for take in stride(from: cnt, to: -1, by: -1) {
            arr[i] = take
            dfs(i-1, cnt - take)
            arr[i] = 0
        }
    }
    
    dfs(10, n)
    return (ans == -1) ? [-1] : ansArr
}

// 3 [0,0,0,0]

