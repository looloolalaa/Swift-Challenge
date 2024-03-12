// 양옆으로 조건에 맞을때동안 뻗어나가기
let N = Int(readLine()!)!
var arr = [-1] + readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    if line[0] == 1 {
        for i in stride(from: line[1], to: arr.count, by: line[1]) {
            arr[i] = (arr[i] == 0) ? 1 : 0
        }
    } else {
        var (s, e) = (line[1], line[1])
        while 0 < s && e < arr.count && arr[s] == arr[e] {
            s -= 1
            e += 1
        }
        for i in (s+1)..<e {
            arr[i] = (arr[i] == 0) ? 1 : 0
        }
    }
}

for i in 1..<N+1 {
    print(arr[i], terminator: " ")
    if i % 20 == 0 { print() }
}
