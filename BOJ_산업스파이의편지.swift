// 줄 세우기 (+0 쓰기)
import Foundation

let N = 1000_0000
var isPrime = Array(repeating: true, count: N)
isPrime[0] = false
isPrime[1] = false

for i in 2..<Int(sqrt(Double(N)))+1 {
    if isPrime[i] {
        for j in stride(from: 2*i, to: N, by: i) {
            isPrime[j] = false
        }
    }
}

for _ in 0..<Int(readLine()!)! {
    let n = Array(readLine()!)
    
    var visited = Array(repeating: false, count: n.count)
    var temp: [Character] = []
    var set = Set<Int>()
    func dfs(_ i: Int) {
        let num = Int(String(temp)) ?? 0
        set.insert(num)
        
        if i == n.count {
            return
        }
        
        for j in 0..<n.count {
            if !visited[j] {
                temp.append(n[j])
                visited[j] = true
                dfs(i+1)
                visited[j] = false
                temp.removeLast()
            }
        }
    }
    
    dfs(0)
    print(set.filter { isPrime[$0] }.count)
}

