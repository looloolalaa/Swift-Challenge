// LIS 응용 최장증가부분수열
let n = Int(readLine()!)!
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 0, count: n+1)
for i in 1...n {
    dp[i] = (0..<n).filter { j in arr[j] < arr[i] }.map { dp[$0] }.max()! + 1
}

print(dp.max()!)
