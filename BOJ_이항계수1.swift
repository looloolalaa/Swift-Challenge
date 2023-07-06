// dfs combinations
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (inp[0], inp[1])

var res = 0
func dfs(_ i: Int, _ j: Int) {
    if i == K {
        res += 1
        return
    }
    for k in j..<N {
        dfs(i+1, k+1)
    }
}

dfs(0, 0)
print(res)
