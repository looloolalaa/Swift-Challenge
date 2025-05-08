// 물 있는 통 붓기
let ABC = readLine()!.split(separator: " ").map { Int($0)! }
let (A, B, C) = (ABC[0], ABC[1], ABC[2])

var visited = Array(repeating: Array(repeating: Array(repeating: false, count: C+1), count: B+1), count: A+1)

var ans = Set<Int>()
func dfs(_ a: Int, _ b: Int, _ c: Int) {
    if visited[a][b][c] {
        return
    }
    
    visited[a][b][c] = true
    if a == 0 {
        ans.insert(c)
    }
    
    if a > 0 {
        let aTob = min(a, B-b)
        dfs(a-aTob, b+aTob, c)
        
        let aToc = min(a, C-c)
        dfs(a-aToc, b, c+aToc)
    }
    
    if b > 0 {
        let bToa = min(b, A-a)
        dfs(a+bToa, b-bToa, c)
        
        let bToc = min(b, C-c)
        dfs(a, b-bToc, c+bToc)
    }
    
    if c > 0 {
        let cToa = min(c, A-a)
        dfs(a+cToa, b, c-cToa)
        
        let cTob = min(c, B-b)
        dfs(a, b+cTob, c-cTob)
    }
}

dfs(0, 0, C)
print(ans.sorted().map { String($0) }.joined(separator: " "))
