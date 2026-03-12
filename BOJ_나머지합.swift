// M으로 나누어 떨어지는 구간합의 개수
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var s = Array(repeating: 0, count: N+1)
for i in 1...N {
    s[i] = s[i-1] + arr[i-1]
}

var ans = 0
var counter: [Int: Int] = [:]
for i in 0...N {
    ans += counter[s[i] % M, default: 0]
    counter[s[i] % M, default: 0] += 1
}

print(ans)
