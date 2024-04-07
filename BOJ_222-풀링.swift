// 2칸씩 띄워서 2차원 인덱스 순회
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func converting(_ arr: [[Int]]) -> [[Int]] {
    var res: [[Int]] = []
    for i in stride(from: 0, to: arr.count, by: 2) {
        var line: [Int] = []
        for j in stride(from: 0, to: arr.count, by: 2) {
            line.append([(i, j), (i, j+1), (i+1, j), (i+1, j+1)].map { arr[$0][$1] }.sorted()[2])
        }
        res.append(line)
    }
    return res
}

while arr.count > 1 {
    arr = converting(arr)
}

print(arr[0][0])
