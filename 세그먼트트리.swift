// 세그먼트 트리 - 구간합, 구간 최솟값, 구간 최댓값, 구간곱 모두 가능
var arr = [1, 9, 3, 8, 4,
           5, 5, 9, 10, 3,
           4, 5]

let n = arr.count

var tree = Array(repeating: -1, count: 4*n)

func initi(_ node: Int, _ start: Int, _ end: Int) {
    if start == end {
        tree[node] = arr[start]
    } else {
        let mid = (start + end) / 2
        initi(node*2, start, mid)
        initi(node*2+1, mid+1, end)

        tree[node] = tree[node*2] + tree[node*2+1]
    }
}

func sum(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) -> Int {
    if right < start || end < left {
        return 0
    }
    if left <= start && end <= right {
        return tree[node]
    }

    let mid = (start + end) / 2

    return sum(node*2, start, mid, left, right) + sum(node*2+1, mid+1, end, left, right)
}

func update(_ node: Int, _ start: Int, _ end: Int, _ index: Int, _ diff: Int) {
    if index < start || end < index {
        return
    }

    tree[node] += diff
    if start == end { return }

    let mid = (start + end) / 2
    update(node*2, start, mid, index, diff)
    update(node*2+1, mid+1, end, index, diff)
}


initi(1, 0, n-1)
print(tree)

// 4~8 구간합
let (a, b) = (4, 8)
print(sum(1, 0, n-1, a, b))


// arr[7]를 6으로 바꾸고자 한다면
//let diff = 6 - arr[7]
//update(1, 0, n-1, 7, diff)
