// visited dfs
for _ in 0..<Int(readLine()!)! {
    var arr: [[Int]] = []
    for _ in 0..<11 {
        arr.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    var visited = Array(repeating: false, count: 11)
    var ans = 0
    func dfs(_ i: Int, _ sum: Int) {
        if i == 11 {
            ans = max(ans, sum)
            return
        }
        
        for pos in 0..<11 {
            if !visited[pos] && arr[i][pos] > 0 {
                visited[pos] = true
                dfs(i+1, sum+arr[i][pos])
                visited[pos] = false
            }
        }
    }
    
    dfs(0, 0)
    print(ans)
}

