// a+b == T 인 쌍 구하기
let T = Int(readLine()!)!
let n = Int(readLine()!)!
var A = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var B = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for i in 1...n {
    A[i] += A[i-1]
}
for j in 1...m {
    B[j] += B[j-1]
}

var ABook: [Int: Int] = [:]
for len in 1...n {
    for s in 1...n-len+1 {
        ABook[A[s+len-1]-A[s-1], default: 0] += 1
    }
}

var BBook: [Int: Int] = [:]
for len in 1...m {
    for s in 1...m-len+1 {
        BBook[B[s+len-1]-B[s-1], default: 0] += 1
    }
}

var ans = 0
for (sum, cnt) in ABook {
    ans += BBook[T-sum, default: 0] * cnt
}
print(ans)
