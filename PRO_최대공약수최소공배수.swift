// 유클리드 호제법
// gcd(a, b) == gcd(b, a%b)
// lcm == a*b/gcd(a,b)
func gcd(_ a: Int, _ b: Int) -> Int {
    return a%b == 0 ? b : gcd(b, a%b)
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), n*m/gcd(n, m)]
}

func gcd3(_ a: Int, _ b: Int, _ c: Int) -> Int {
    return gcd(gcd(a, b), c)
}
