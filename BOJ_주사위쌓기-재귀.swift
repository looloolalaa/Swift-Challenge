// 1...6 으로 시작해보기
let N = Int(readLine()!)!
var dice: [[Int]] = []
for _ in 0..<N {
    dice.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let pair = [5,3,4,1,2,0]

var ans = 0
func dfs(_ i: Int, _ before: Int, _ s: Int) {
    if i == N {
        ans = max(ans, s)
        return
    }
    
    let di = dice[i]
    let p = di.firstIndex(of: before)!
    let oppo = pair[p]
    let maxi = (0..<6).filter { $0 != p && $0 != oppo }.map { di[$0] }.max()!
    dfs(i+1, di[oppo], s + maxi)
    
}

for i in 1...6 {
    dfs(0, i, 0)
}
print(ans)
