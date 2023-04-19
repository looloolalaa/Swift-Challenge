// 구간합이 0인 구간의 개수
// 누적합 + Counter
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var s = Array(repeating: 0, count: n + 1)
for i in 1..<n+1 {
    s[i] = s[i-1] + arr[i-1]
}


var counter: [Int: Int] = [:]
var result = 0
for i in 0..<n+1 {
    result += counter[s[i], default: 0]
    counter[s[i], default: 0] += 1
}

print(result)



