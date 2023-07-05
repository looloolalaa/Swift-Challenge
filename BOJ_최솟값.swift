// 세그먼트 트리: 구간 최솟값
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])

var arr: [Int] = []
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

var ab: [[Int]] = []
for _ in 0..<M {
    let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
    ab.append([inp[0]-1, inp[1]-1])
}

var tree = Array(repeating: -1, count: 4*N)

func initi(_ node: Int, _ start: Int, _ end: Int) {
    if start == end {
        tree[node] = arr[start]
    } else {
        let mid = (start + end) / 2
        initi(node*2, start, mid)
        initi(node*2+1, mid+1, end)
        tree[node] = min(tree[node*2], tree[node*2+1])
    }
}

func getMin(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) -> Int {
    if right < start || end < left {
        return Int(1e9)
    }
    if left <= start && end <= right {
        return tree[node]
    }
    let mid = (start + end) / 2
    return min(getMin(node*2, start, mid, left, right), getMin(node*2+1, mid+1, end, left, right))
}

initi(1, 0, N-1)
var result: [Int] = []
for pair in ab {
    let (a, b) = (pair[0], pair[1])
    result.append(getMin(1, 0, N-1, a, b))
}

for r in result {
    print(r)
}

