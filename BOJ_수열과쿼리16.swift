// 세그먼트 트리 최소값 인덱스
let INF = Int(1e10)
let N = Int(readLine()!)!
var arr = [INF] + readLine()!.split(separator: " ").map { Int($0)! }

var tree = Array(repeating: -1, count: N * 4)

func initi(_ a: Int, _ b: Int, _ i: Int) {
    if a == b {
        tree[i] = a
        return
    }
    let mid = (a + b) / 2
    initi(a, mid, 2*i)
    initi(mid+1, b, 2*i+1)
    let (minLeftIndex, minRightIndex) = (tree[2*i], tree[2*i+1])
    if arr[minLeftIndex] < arr[minRightIndex] {
        tree[i] = minLeftIndex
    } else if arr[minLeftIndex] > arr[minRightIndex] {
        tree[i] = minRightIndex
    } else {
        tree[i] = min(minLeftIndex, minRightIndex)
    }
}

func mini(_ a: Int, _ b: Int, _ i: Int, _ x: Int, _ y: Int) -> Int {
    if y < a || b < x {
        return 0
    }
    if x <= a && b <= y {
        return tree[i]
    }
    let mid = (a + b) / 2
    let (minLeftIndex, minRightIndex) = (mini(a, mid, 2*i, x, y), mini(mid+1, b, 2*i+1, x, y))
    if arr[minLeftIndex] < arr[minRightIndex] {
        return minLeftIndex
    } else if arr[minLeftIndex] > arr[minRightIndex] {
        return minRightIndex
    } else {
        return min(minLeftIndex, minRightIndex)
    }
}

func update(_ a: Int, _ b: Int, _ i: Int, _ idx: Int, _ val: Int) {
    if idx < a || b < idx {
        return
    }
    if a == b {
        arr[idx] = val
        return
    }
    let mid = (a + b) / 2
    update(a, mid, 2*i, idx, val)
    update(mid+1, b, 2*i+1, idx, val)
    let (minLeftIndex, minRightIndex) = (tree[2*i], tree[2*i+1])
    if arr[minLeftIndex] < arr[minRightIndex] {
        tree[i] = minLeftIndex
    } else if arr[minLeftIndex] > arr[minRightIndex] {
        tree[i] = minRightIndex
    } else {
        tree[i] = min(minLeftIndex, minRightIndex)
    }
}

initi(1, N, 1)

let M = Int(readLine()!)!
for _ in 0..<M {
    let li = readLine()!.split(separator: " ").map { Int($0)! }
    if li[0] == 1 {
        update(1, N, 1, li[1], li[2])
    } else if li[0] == 2 {
        print(mini(1, N, 1, li[1], li[2]))
    }
}
