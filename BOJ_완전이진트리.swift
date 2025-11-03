// 트리순회
let K = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var tree = Array(repeating: [Int](), count: K)

func dfs(_ arr: [Int], _ depth: Int) {
    if depth == K { return }
    let center = arr.count/2
    tree[depth].append(arr[center])
    dfs(Array(arr[..<center]), depth+1)
    dfs(Array(arr[(center+1)...]), depth+1)
}

dfs(arr, 0)

for t in tree {
    print(t.map { String($0) }.joined(separator: " "))
}
