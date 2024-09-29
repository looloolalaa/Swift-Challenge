// 그래프에서 삼각형 찾기
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var graph = Array(repeating: Set<Int>(), count: N+1)
var cnt = Array(repeating: 0, count: N+1)
var edges: [[Int]] = []
for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab.min()!, ab.max()!)
    
    graph[a].insert(b)
    cnt[a] += 1
    cnt[b] += 1
}

let INF = Int(1e9)
var mini = INF
for a in 1...N {
    for b in graph[a] {
        for c in graph[b] {
            if graph[a].contains(c) {
                mini = min(mini, cnt[a] + cnt[b] + cnt[c] - 6)
            }
        }
    }
}

print((mini == INF) ? -1 : mini)
