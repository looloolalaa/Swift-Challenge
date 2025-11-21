// BST 전위 -> 후위
var arr: [Int] = []
while true {
    guard let n = readLine(), !n.isEmpty else { break }
    arr.append(Int(n)!)
}

var tree: [Int: [Int]] = [:]
func makeTree(_ arr: [Int]) {
    let root = arr[0]
    tree[root] = [-1,-1]
    
    if arr.count == 1 {
        return
    }
    
    let k = arr.firstIndex { $0 > root } ?? arr.count
    let left = Array(arr[1..<k])
    let right = Array(arr[k...])
    
    if !left.isEmpty {
        tree[root]![0] = left[0]
        makeTree(left)
    }
    if !right.isEmpty {
        tree[root]![1] = right[0]
        makeTree(right)
    }
    
}

makeTree(arr)

func dfs(_ node: Int) {
    if node == -1 { return }
    
    dfs(tree[node]![0])
    dfs(tree[node]![1])
    print(node)
}

dfs(arr[0])


