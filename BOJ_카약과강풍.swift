// 옆 팀에 노나주기
let li = readLine()!.split(separator: " ").map { Int($0)! }
let (N, S, R) = (li[0], li[1], li[2])
var arr = Array(repeating: 1, count: N)
for i in readLine()!.split(separator: " ").map({ Int($0)! }) {
    arr[i-1] -= 1
}
for i in readLine()!.split(separator: " ").map({ Int($0)! }) {
    arr[i-1] += 1
}

for i in 0..<N {
    if arr[i] == 2 {
        if 0 < i && arr[i-1] == 0 {
            arr[i] -= 1
            arr[i-1] += 1
        } else if i < N-1 && arr[i+1] == 0 {
            arr[i] -= 1
            arr[i+1] += 1
        }
    }
}

print(arr.filter { $0 == 0 }.count)
