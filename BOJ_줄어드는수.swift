// 감소하는 수 sort 풀이
var res: [Int] = []
func dfs(_ now: [Int]) {
    if let num = Int(now[1...].map { String($0) }.joined(separator: "")) {
        res.append(num)
    }
    for i in 0..<now.last! {
        dfs(now + [i])
    }
}

dfs([10])
res.sort()

let k = Int(readLine()!)!-1
print(res.count <= k ? -1 : res[k])
