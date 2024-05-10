// product -> dfs
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, S) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var res = 0
func dfs(_ i: Int, _ s: Int) {
    if i == N {
        if s == S { res += 1 }
        return
    }
    
    dfs(i+1, s)
    dfs(i+1, s+arr[i])
}

dfs(0, 0)

if S == 0 { res -= 1 }
print(res)
