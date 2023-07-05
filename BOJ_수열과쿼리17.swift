// 세그먼트 트리: 구간 최솟값 update
import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").map { Int($0)! }
let M = Int(readLine()!)!



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
        return Int(1e9) + 1
    }
    if left <= start && end <= right {
        return tree[node]
    }
    
    let mid = (start + end) / 2
    return min(getMin(node*2, start, mid, left, right), getMin(node*2+1, mid+1, end, left, right))
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
    tree[node] = min(tree[node*2], tree[node*2+1])
    
}


initi(1, 0, N-1)


var result: [Int] = []
for _ in 0..<M {
    let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
    if inp[0] == 1 {
        let (i, v) = (inp[1]-1, inp[2])
        arr[i] = v
        update(1, 0, N-1, i, v)
    } else if inp[0] == 2 {
        let (i, j) = (inp[1]-1, inp[2]-1)
        result.append(getMin(1, 0, N-1, i, j))
    }
    
}


for r in result {
    print(r)
}
