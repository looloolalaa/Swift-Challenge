// 2*3*5와 4*5의 최대 공약수
let N = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
let M = Int(readLine()!)!
var b = readLine()!.split(separator: " ").map { Int($0)! }

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a % b)
}

var res = 1
var over = false
for i in 0..<N {
    for j in 0..<M {
        let g = gcd(a[i], b[j])
        res *= g
        if String(res).count > 9 {
            res %= 10_0000_0000
            over = true
        }
        a[i] /= g
        b[j] /= g
    }
}

if over {
    print(String(repeating: "0", count: 9-String(res).count) + String(res))
} else {
    print(res)
}
