// 텔레포트 지름길
let ND = readLine()!.split(separator: " ").map { Int($0)! }
let (N, D) = (ND[0], ND[1])

var roads: [Int: [(Int, Int)]] = [:]
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, e, d) = (line[0], line[1], line[2])
    
    if e <= D {
        roads[s, default: []].append((e, d))
    }
}

var dp = Array(0...D)
for i in 0..<D {
    if let eds = roads[i] {
        for ed in eds {
            let (e, d) = (ed.0, ed.1)
            dp[e] = min(dp[e], dp[i] + d)
        }
    }
    dp[i+1] = min(dp[i+1], dp[i] + 1)
}

print(dp[D])
