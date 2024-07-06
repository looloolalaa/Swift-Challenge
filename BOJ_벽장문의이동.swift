// le ri 와 aim의 위치
let N = Int(readLine()!)!
let lr = readLine()!.split(separator: " ").map { Int($0)! }
var (le, ri) = (lr[0], lr[1])

var arr: [Int] = []
let K = Int(readLine()!)!
for _ in 0..<K {
    arr.append(Int(readLine()!)!)
}

var ans = Int(1e9)
func dfs(_ i: Int, _ le: Int, _ ri: Int, _ move: Int) {
    if i == K {
        ans = min(ans, move)
        return
    }
    
    let aim = arr[i]
    if le == aim || ri == aim {
        dfs(i+1, le, ri, move)
    } else if (le+1..<ri) ~= aim {
        dfs(i+1, aim, ri, move + aim-le)

        dfs(i+1, le, aim, move + ri-aim)
    } else if ri < aim {
        dfs(i+1, le, aim, move + aim-ri)
    } else if aim < le {
        dfs(i+1, aim, ri, move + le-aim)
    }
}

dfs(0, le, ri, 0)
print(ans)
