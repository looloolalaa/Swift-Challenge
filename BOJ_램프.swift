// 전구 라인 키기
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var arr: [String: Int] = [:]
for _ in 0..<N {
    arr[readLine()!, default: 0] += 1
}

let K = Int(readLine()!)!

func canTurnOnAll(_ line: String) -> Bool {
    let zeroCnt = line.filter { $0 == "0" }.count
    if zeroCnt > K { return false }
    return (K - zeroCnt) % 2 == 0
}

var ans = 0
for (line, cnt) in arr {
    if canTurnOnAll(line) {
        ans = max(ans, cnt)
    }
}

print(ans)
