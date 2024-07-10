// dfs 조건 (최소최대등)
let li = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L, R, X) = (li[0], li[1], li[2], li[3])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var ans = 0
func dfs(_ i: Int, _ cnt: Int, _ sum: Int, _ mini: Int, _ maxi: Int) {
    if i == N {
        if cnt >= 2 && (L...R) ~= sum && X <= (maxi - mini) {
            ans += 1
        }
        return
    }
    
    dfs(i+1, cnt, sum, mini, maxi)
    dfs(i+1, cnt+1, sum+arr[i], min(mini, arr[i]), max(maxi, arr[i]))
}

dfs(0, 0, 0, Int(1e7), 0)
print(ans)
