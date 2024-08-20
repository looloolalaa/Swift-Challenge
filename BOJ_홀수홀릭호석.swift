// [Ch] 3파트로 나누기
let N = Array(readLine()!)

var (mini, maxi) = (Int(1e9), 0)
func dfs(_ num: [Character], _ cnt: Int) {
    let newCnt = cnt + num.filter { Int(String($0))!%2 == 1 }.count
    
    if num.count == 1 {
        mini = min(mini, newCnt)
        maxi = max(maxi, newCnt)
        return
    }
    
    if num.count == 2 {
        let nextNum = Int(String(num[0]))!+Int(String(num[1]))!
        dfs(Array(String(nextNum)), newCnt)
    } else if num.count >= 3 {
        for i in 1..<num.count-1 {
            for j in (i+1)..<num.count {
                let a = Int(String(num[..<i]))!
                let b = Int(String(num[i..<j]))!
                let c = Int(String(num[j...]))!
                dfs(Array(String(a+b+c)), newCnt)
            }
        }
    }
}


dfs(N, 0)
print(mini, maxi)
