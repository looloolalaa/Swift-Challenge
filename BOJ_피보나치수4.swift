// Int 범위 넘기는 큰 수
import Foundation

func add(_ a: [Int], _ b: [Int]) -> [Int] {
    let zeroCnt = b.count - a.count
    let a = a + Array(repeating: 0, count: zeroCnt)
//    [1,2,3,4,5]
//    [8,8,8,0,0]
    
    var ans: [Int] = []
    var carry = 0
    for i in 0..<b.count {
        let res = b[i] + a[i] + carry
        
        ans.append(res % 10)
        carry = res / 10
    }
    
    if carry == 1 { ans.append(1) }
    return ans
}

let n = Int(readLine()!)!
if n <= 1 { print(n); exit(0) }

var dp: [[Int]] = Array(repeating: [], count: n+1)
dp[0] = [0]
dp[1] = [1]

for i in 2...n {
    dp[i] = add(dp[i-2], dp[i-1])
}

print(dp[n].reversed().map { String($0) }.joined())

