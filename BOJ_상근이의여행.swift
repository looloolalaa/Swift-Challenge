// 모든 노드 연결하는 간선개수
let T = Int(readLine()!)!
for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M) = (NM[0], NM[1])
    for _ in 0..<M {
        let _ = readLine()!
    }
    print(N-1)
}
