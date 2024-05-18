// dfs
var arr: [Int] = []
func dfs(_ now: [Int], _ maxDepth: Int) {
    if now.count >= maxDepth {
        arr.append(Int(now[1...].map { String($0) }.joined(separator: ""))!)
        return
    }
    for i in 0..<now.last! {
        dfs(now + [i], maxDepth)
    }
}

for depth in 2...11 {
    dfs([10], depth)
}

let N = Int(readLine()!)!
if N >= arr.count { print(-1) }
else { print(arr[N]) }



