// 방향 그래프에서 사이클 찾기
for _ in 0..<Int(readLine()!)! {
    
    let N = Int(readLine()!)!
    let graph = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    
    var visited = Array(repeating: false, count: N+1)
    var recStack = Array(repeating: false, count: N+1)
    
    var cycles: [Int] = []
    func dfs(_ i: Int) {
        if recStack[i] { cycles.append(i) }
        if visited[i] { return }
        
        visited[i] = true
        recStack[i] = true
        
        let a = graph[i]
        dfs(a)
        recStack[i] = false
    }
    
    for i in 1...N {
        if !visited[i] {
            dfs(i)
        }
    }
    
    var team = 0
    for i in cycles {
        var s = i
        while graph[s] != i {
            s = graph[s]
            team += 1
        }
        team += 1
    }
    
    print(N - team)
    
}
