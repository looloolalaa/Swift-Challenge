// 끝나는 시각이 빠른 회의 잡기
// 그럼 (4, 4) (1, 4) 에선 어떤거 먼저?
let N = Int(readLine()!)!
var times: [[Int]] = []
for _ in 0..<N {
    let inp = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, e) = (inp[0], inp[1])
    times.append([s, e])
}

times.sort { ($0[1], $0[0]) < ($1[1], $1[0]) }
var res = 0
var end = 0
for time in times {
    let (s, e) = (time[0], time[1])
    if end <= s {
        res += 1
        end = e
    }
}
print(res)
