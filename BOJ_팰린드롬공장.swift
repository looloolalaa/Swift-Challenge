// 문자열 연산 dp
func getMinCnt(_ str: [Character]) -> Int {
    var dp = Array(repeating: Array(repeating: -1, count: N), count: N)
    
    func getDP(_ i: Int, _ j: Int) -> Int {
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        
        if i >= j {
            return 0
        }
        
        if str[i] == str[j] {
            dp[i][j] = getDP(i+1, j-1)
            return dp[i][j]
        }
        
        dp[i][j] = min(getDP(i, j-1)+1, getDP(i+1, j)+1, getDP(i+1, j-1)+1)
        return dp[i][j]
    }

    return getDP(0, N-1)
}

var inp = Array(readLine()!)
let N = inp.count

var ans = getMinCnt(inp)
for i in 0..<N {
    for j in (i+1)..<N {
        (inp[i], inp[j]) = (inp[j], inp[i])
        ans = min(ans, getMinCnt(inp) + 1)
        (inp[i], inp[j]) = (inp[j], inp[i])
    }
}
print(ans)
