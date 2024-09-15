// 비트마스킹 + dp
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM.max()!, NM.min()!)

// dp[idx][state]
// == idx번째 칸을 기준으로 이전 M+1 개의 칸의 상태가 state일 때
// idx 이후 모든 칸을 채우는 경우의 수

var dp = Array(repeating: Array(repeating: 0, count: 1<<(M+1)), count: N*M)
let MOD = 1_000_000_007

func get_dp(_ idx: Int, _ state: Int) -> Int {
    if idx == N*M {
        return 1
    }
    
    if dp[idx][state] != 0 {
        return dp[idx][state] % MOD
    }
    
    if idx % M != 0 && (state & 1) != 0 && (state & 2) != 0 && (state & (1<<M)) != 0 {
        dp[idx][state] = get_dp(idx+1, state>>1) % MOD
    } else {
        dp[idx][state] = get_dp(idx+1, state>>1) % MOD + get_dp(idx+1, (state>>1) | (1<<M)) % MOD
    }
    
    return dp[idx][state] % MOD
}

print(get_dp(0, 0))
