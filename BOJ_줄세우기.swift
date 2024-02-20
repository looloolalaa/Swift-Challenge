// 위상 정렬 (Topology Sort)
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

var indegree = Array(repeating: 0, count: N+1)
var graph: [Int: [Int]] = [:]
for _ in 0..<M {
    let li = readLine()!.split(separator: " ").map { Int($0)! }
    let (A, B) = (li[0], li[1])
    
    graph[A, default: []].append(B)
    indegree[B] += 1
}


var stack: [Int] = []
for i in 1...N {
    if indegree[i] == 0 {
        stack.append(i)
    }
}

for _ in 0..<N {
    if stack.isEmpty {
        print("cycle")
        break
    }
    
    let now = stack.removeLast()
    print(now, terminator: " ")
    for a in graph[now, default: []] {
        indegree[a] -= 1
        if indegree[a] == 0 {
            stack.append(a)
        }
    }
}
