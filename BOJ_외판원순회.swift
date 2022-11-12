// dis[s][i] == 현재까지 방문한 집합이 s 이고, 현재 위치한 곳이 i 일때,
// 아직 방문하지 않은 모든 곳을 방문하고 시작위치(0)로 가는 거리
import Foundation

// O(n^2*2^n): dis 배열 개수(2**n * n) * 하나 당 최솟값 찾기(n)
func TSP() {
    let n = Int(readLine()!)! // 4
    
    var graph: [[Int]] = []
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    
    let setCount = Int(pow(2, Double(n))) // 2**4: 0000~1111
    var dis: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: setCount)
    
    
    let MAX = 1700_0000 // 1,000,000 * 16
    
    func add(_ s: Int, _ i: Int) -> Int {
        // (1010, 2) -> 1110
        return s | (1 << i)
    }
    
    func isVisited(_ s: Int, _ i: Int) -> Bool {
        // (1010, 1) -> true
        return (s & (1 << i)) != 0
    }
    
    func allVisited(_ s: Int) -> Bool {
        // s == 1111
        return s == setCount - 1
    }

    
    func getDis(_ s: Int, _ i: Int) -> Int {
        if dis[s][i] != 0 { // 이미 저장되어 있는 값이 있다면
            return dis[s][i]
        }
        
        if allVisited(s) { // 다 방문하고 현재 위치가 i 일때
            let d = (graph[i][0] == 0) ? MAX : graph[i][0] // 시작위치 0 으로 가는 길이 있는가?
            dis[s][i] = d
            return dis[s][i]
        }
        
        var minDis = MAX
        for j in 0..<n {
            // i 에 인접한 j 중에서, i -> j 로 갈 수 있는 길이 있고, 아직 방문하지 않은 곳들에 대하여
            if i != j && !isVisited(s, j) && graph[i][j] != 0 {
                let newDis = graph[i][j] + getDis(add(s, j), j)
                minDis = min(minDis, newDis)
            }
        }
        
        // (10101, 2) 이면 graph[2][1] + getDis(10111, 1) 과 graph[2][3] + getDis(11101, 3) 둘 중 최솟값
        dis[s][i] = minDis
        return dis[s][i]
    }
    
    // (s: 0001, i: 0)
    print(getDis(1, 0))
}


