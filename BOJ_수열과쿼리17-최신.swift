// 세그먼트 트리 - 최소값
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let INF = Int(1e10)

var tree = Array(repeating: -1, count: N * 4)

func initi(_ a: Int, _ b: Int, _ i: Int) {
    if a == b {
        tree[i] = arr[a]
        return
    }
    let mid = (a + b) / 2
    initi(a, mid, 2*i)
    initi(mid+1, b, 2*i+1)
    tree[i] = min(tree[2*i], tree[2*i+1])
}

func mini(_ a: Int, _ b: Int, _ i: Int, _ x: Int, _ y: Int) -> Int {
    if y < a || b < x {
        return INF
    }
    if x <= a && b <= y {
        return tree[i]
    }
    let mid = (a + b) / 2
    return min(mini(a, mid, 2*i, x, y), mini(mid+1, b, 2*i+1, x, y))
}

func update(_ a: Int, _ b: Int, _ i: Int, _ idx: Int, _ val: Int) {
    if idx < a || b < idx {
        return
    }
    if a == b {
        tree[i] = val
        return
    }
    let mid = (a + b) / 2
    update(a, mid, 2*i, idx, val)
    update(mid+1, b, 2*i+1, idx, val)
    tree[i] = min(tree[2*i], tree[2*i+1])
}

initi(0, N-1, 1)

let M = Int(readLine()!)!
for _ in 0..<M {
    let li = readLine()!.split(separator: " ").map { Int($0)! }
    if li[0] == 1 {
        update(0, N-1, 1, li[1]-1, li[2])
    } else if li[0] == 2 {
        print(mini(0, N-1, 1, li[1]-1, li[2]-1))
    }
}
