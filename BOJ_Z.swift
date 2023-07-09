// 사분면 dfs
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (N, r, c) = (inp[0], inp[1], inp[2])

func dfs(_ n: Int, _ i: Int, _ j: Int) -> Int {
    if n == 1 {
        return 0
    }
    
    let half = n / 2
    if r < i+half && c < j+half {
        return dfs(half, i, j)
    }
    if r < i+half && c >= j+half {
        return half*half + dfs(half, i, j+half)
    }
    if r >= i+half && c < j+half {
        return half*half*2 + dfs(half, i+half, j)
    }
    if r >= i+half && c >= j+half {
        return half*half*3 + dfs(half, i+half, j+half)
    }
    
    return 0
}

print(dfs((1 << N), 0, 0))
