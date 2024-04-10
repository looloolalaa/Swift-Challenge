// bundle (a,b,c) 우선 순위
let T = Int(readLine()!)!
for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k, id, m) = (line[0], line[1], line[2], line[3])
    var score = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
    var cnt = Array(repeating: 0, count: n+1)
    var time = Array(repeating: 0, count: n+1)
    
    for t in 0..<m {
        let li = readLine()!.split(separator: " ").map { Int($0)! }
        score[li[0]][li[1]] = max(score[li[0]][li[1]], li[2])
        cnt[li[0]] += 1
        time[li[0]] = t
    }
    
    let rank = (1...n).sorted { (score[$0].reduce(0, +), -cnt[$0], -time[$0]) > (score[$1].reduce(0, +), -cnt[$1], -time[$1]) }
    
    print(rank.firstIndex(of: id)!+1)
}
