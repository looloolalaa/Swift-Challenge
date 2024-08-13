// (a+b), (c+d)
let N = Int(readLine()!)!
var arr: [[Int]] = [[], [], [], []]

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    for i in 0..<4 {
        arr[i].append(line[i])
    }
}

var ab: [Int: Int] = [:]
for a in arr[0] {
    for b in arr[1] {
        ab[a+b, default: 0] += 1
    }
}


var ans = 0
for c in arr[2] {
    for d in arr[3] {
        ans += ab[-(c+d), default: 0]
    }
}
print(ans)
