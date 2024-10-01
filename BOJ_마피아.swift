// 조건 분기가 포함된 state dfs
import Foundation

let N = Int(readLine()!)!
var points = readLine()!.split(separator: " ").map { Int($0)! }
var R: [[Int]] = []
for _ in 0..<N {
    R.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let me = Int(readLine()!)!
var alive = Array(repeating: true, count: N)

func aliveCount() -> Int {
    return alive.filter { $0 }.count
}

func brightDie() -> Int {
    var die = -1
    var maxPoint = -1
    for i in 0..<N where alive[i] {
        if points[i] > maxPoint {
            die = i
            maxPoint = points[i]
        }
    }
    return die
}

func canKill() -> [Int] {
    return (0..<N).filter { alive[$0] && $0 != me }
}

func updatePoints(_ i: Int) {
    for j in 0..<N where i != j {
        points[j] += R[i][j]
    }
}

func downdatePoints(_ i: Int) {
    for j in 0..<N where i != j {
        points[j] -= R[i][j]
    }
}

var ans = 0
func dfs(_ night: Int) {
    if !alive[me] {
        ans = max(ans, night)
        if ans == N / 2 {
            print(ans)
            exit(0)
        }
        return
    }
    
    if aliveCount() % 2 == 0 {
        for i in canKill() {
            alive[i] = false
            updatePoints(i)
            dfs(night + 1)
            downdatePoints(i)
            alive[i] = true
        }
    } else {
        let die = brightDie()
        alive[die] = false
        dfs(night)
        alive[die] = true
    }
}

dfs(0)
print(ans)
