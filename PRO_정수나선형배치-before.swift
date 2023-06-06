// 벽 나올때 까지 더하기
import Foundation

func solution(_ n:Int) -> [[Int]] {
    let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]

    var result = Array(repeating: Array(repeating: 0, count: n), count: n)

    var now = [0, 0]
    var d = 0

    var num = 1
    for _ in 0..<n*n {
        var np = [now[0]+dxy[d][0], now[1]+dxy[d][1]]
        while (0<=np[0] && np[0]<n && 0<=np[1] && np[1]<n) && result[np[0]][np[1]] == 0 {
            result[now[0]][now[1]] = num
            num += 1
            now = np
            np = [now[0]+dxy[d][0], now[1]+dxy[d][1]]
            if num > n*n {
                break
            }
        }

        d = (d+1) % 4

        if num > n*n {
            break
        }

    }

    result[now[0]][now[1]] = num
    return result
}
