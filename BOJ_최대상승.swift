// 내 앞까지 최소값 저장하기
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var res = 0
var mini = arr[0]
for a in arr[1...] {
    res = max(res, a - mini)
    if mini > a {
        mini = a
    }
}
print(res)
