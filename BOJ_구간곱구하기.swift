// 세그먼트 트리: 구간곱
// 큰 수 나머지 저장
// (a * b) % c == {(a % c) * (b % c)} % c
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M, K) = (inp[0], inp[1], inp[2])
var arr: [Int] = []
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

var tree = Array(repeating: -1, count: 4*N)

func initi(_ node: Int, _ start: Int, _ end: Int) {
    if start == end {
        tree[node] = arr[start]
    } else {
        let mid = (start + end) / 2
        initi(node*2, start, mid)
        initi(node*2+1, mid+1, end)
        tree[node] = (tree[node*2] * tree[node*2+1]) % 1_000_000_007
    }
}

func getMul(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) -> Int {
    if right < start || end < left {
        return 1
    }
    if left <= start && end <= right {
        return tree[node]
    }
    
    let mid = (start + end) / 2
    return (getMul(node*2, start, mid, left, right) * getMul(node*2+1, mid+1, end, left, right)) % 1_000_000_007
}

func update(_ node: Int, _ start: Int, _ end: Int, _ index: Int, _ val: Int) {
    if index < start || end < index {
        return
    }
    if start == end {
        tree[node] = val
        return
    }
    
    let mid = (start + end) / 2
    update(node*2, start, mid, index, val)
    update(node*2+1, mid+1, end, index, val)
    tree[node] = (tree[node*2] * tree[node*2+1]) % 1_000_000_007
}

initi(1, 0, N-1)

var result: [Int] = []
for _ in 0..<(M+K) {
    let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (a, b, c) = (inp[0], inp[1], inp[2])
    
    if a == 1 {
        arr[b-1] = c
        update(1, 0, N-1, b-1, c)
    } else if a == 2 {
        result.append(getMul(1, 0, N-1, b-1, c-1))
    }
    
}


for r in result {
    print(r)
}
