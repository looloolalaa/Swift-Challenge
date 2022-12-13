// 모든 경우의 수 X
// 아래로 누적합
import Foundation

func solution(_ land:[[Int]]) -> Int {
    var land = land
    for i in 1..<land.count {
        for j in 0..<4 {
            var maxi = 0
            for k in 0..<4 {
                if k == j { continue }
                maxi = max(maxi, land[i-1][k])
            }
            land[i][j] += maxi
        }
    }
    return land.last!.max()!
}


// 1 2 3 5
// 10 11 12 11
// 16 15 13 13
