// 외판원 순회와 비슷 - get_cost() + 비트마스크 연산
import Foundation

let N = Int(readLine()!)!
var table: [[Int]] = []
for _ in 0..<N {
    table.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}
let now = Int(readLine()!.map { $0 == "Y" ? "1" : "0" }.joined(), radix: 2)!
let P = Int(readLine()!)!

var cost: [Int: Int] = [:]

func oneCount(_ state: Int) -> Int {
    var count = 0
    for c in String(state, radix: 2) {
        if c == "1" {
            count += 1
        }
    }
    return count
}

func get_cost(_ state: Int) -> Int {
    if oneCount(state) >= P { return 0 }
    if let co = cost[state] { return co }


    var dist: [Int] = Array(repeating: 36, count: N)
    for i in 0..<N {
        if (state & (1 << (N-1-i))) != 0 {
            for j in 0..<N {
                dist[j] = min(dist[j], table[i][j])
            }
        }
    }
    
    var candis: [Int] = []
    for j in 0..<N {
        if state & (1 << (N-1-j)) == 0 {
            candis.append(dist[j] + get_cost(state | (1 << (N-1-j))))
        }
    }
    
    cost[state] = candis.min()!
    return cost[state]!
}


if now == 0 && P > 0 {
    print(-1)
    exit(0)
}

print(get_cost(now))
