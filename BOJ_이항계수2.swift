// 파스칼 삼각형
var memo: [[Int]: Int] = [:]

func comb(_ n: Int, _ k: Int) -> Int {
    if k == 0 || n == k { return 1 }
    
    if memo[[n, k]] != nil { return memo[[n, k]]! }
    
    let res = (comb(n-1, k-1) + comb(n-1, k)) % 10007
    memo[[n,k]] = res
    return res
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])
print(comb(N, K))

