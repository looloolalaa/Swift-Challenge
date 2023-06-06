// 벽 나올때 까지 더하기
import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var d = 0
    var p = [0, 0]
    
    func plus(_ p: [Int], _ d: Int) -> [Int] {
        return [p[0]+dxy[d][0], p[1]+dxy[d][1]]
    }
    
    func valid(_ p: [Int]) -> Bool {
        return 0<=p[0]&&p[0]<n && 0<=p[1]&&p[1]<n
    }
    
    for num in 1...n*n {
        result[p[0]][p[1]] = num
        let np = plus(p, d)
        if !valid(np) || result[np[0]][np[1]] != 0 {
            d = (d+1)%4
        }
        p = plus(p, d)
    }
    
    return result
}
