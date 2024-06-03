// 깰수있는 계란들에 대해 깨기
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var ans = 0
func dfs(_ i: Int) {
    if i == N {
        ans = max(ans, arr.filter { $0[0] <= 0 }.count)
        return
    }
    
    let canBreakEggs = (0..<N).filter { $0 != i && arr[$0][0] > 0 }
    if arr[i][0] <= 0 || canBreakEggs.isEmpty {
        dfs(i+1)
    } else {
        for j in canBreakEggs {
            arr[i][0] -= arr[j][1]
            arr[j][0] -= arr[i][1]
            dfs(i+1)
            arr[j][0] += arr[i][1]
            arr[i][0] += arr[j][1]
        }
    }
}

dfs(0)
print(ans)
