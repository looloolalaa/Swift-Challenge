// M^n == (M^(n/2))^2
func mul(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
    var res = [[0, 0], [0, 0]]
    for i in 0..<2 {
        for j in 0..<2 {
            for m in 0..<2 {
                res[i][j] += a[i][m] * b[m][j]
                res[i][j] %= mod
            }
        }
    }
    return res
}


func fib(_ n: Int) -> [[Int]] {
    if n == 1 { return [[1, 1], [1, 0]] }
    
    let half = fib(n / 2)
    if n % 2 == 0 {
        return mul(half, half)
    } else {
        return mul(fib(1), mul(half, half))
    }
}

let mod = 1_000_000_007
let n = Int(readLine()!)!
print(fib(n)[0][1])
