// 등차수열의 d로 대보기
import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

if N <= 2 {
    print(0)
    exit(0)
}

func changeCount(_ a: Int, _ d: Int) -> Int {
    var cnt = 0
    for i in 2..<N {
        let ai = a+(i-1)*d
        if arr[i] == ai+1 || arr[i] == ai-1 {
            cnt += 1
        } else if arr[i] > ai+1 || arr[i] < ai-1 {
            return -1
        }
    }
    return cnt
}

let INF = Int(1e9)
var mini = INF
for i in [-1,0,1] {
    for j in [-1,0,1] {
        let (a1, a2) = (arr[0]+i, arr[1]+j)
        let d = a2 - a1
        var cnt = changeCount(a2, d)
        if cnt != -1 {
            cnt += abs(i) + abs(j)
            mini = min(mini, cnt)
        }
    }
}

print((mini == INF) ? -1 : mini)
