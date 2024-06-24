// 1...6 으로 시작해보기
let N = Int(readLine()!)!
var dice: [[Int]] = []
for _ in 0..<N {
    dice.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let pair = [5,3,4,1,2,0]

func start(_ num: Int) -> Int {
    var res = 0
    var nxt = num
    for di in dice {
        let p = di.firstIndex(of: nxt)!
        let oppo = pair[p]
        res += (0..<6).filter { $0 != p && $0 != oppo }.map { di[$0] }.max()!
        nxt = di[oppo]
    }
    return res
}

var ans = 0
for i in 1...6 {
    ans = max(ans, start(i))
}
print(ans)
