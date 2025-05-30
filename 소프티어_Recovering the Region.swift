// 스도쿠 구역
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<N {
    print(Array(repeating: "\(i+1)", count: N).joined(separator: " "))
}
