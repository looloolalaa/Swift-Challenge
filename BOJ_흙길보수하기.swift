// 판자 덮기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L) = (line[0], line[1])
var water: [[Int]] = []
for _ in 0..<N {
    water.append(readLine()!.split(separator: " ").map { Int($0)! })
}
water.sort { $0[0] < $1[0] }


var ans = 0
var now = 0
for w in water {
    if w[1] <= now { continue }
    now = max(now, w[0])
    
    let dist = w[1]-now
    var wood = dist / L
    if dist % L != 0 { wood += 1 }
    now += wood * L
    
    ans += wood
}

print(ans)
