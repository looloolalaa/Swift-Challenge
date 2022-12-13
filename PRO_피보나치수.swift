// 나머지(%)
func solution(_ n:Int) -> Int {
    var memo: [Int: Int] = [0: 0, 1: 1]
    
    for i in (2...n) {
        memo[i] = (memo[i-2]! + memo[i-1]!) % 1234567
    }
    
    return memo[n]!
}
