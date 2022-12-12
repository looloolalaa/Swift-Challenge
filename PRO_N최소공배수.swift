// n lcm
func solution(_ arr:[Int]) -> Int {
    func gcd(_ x: Int, _ y: Int) -> Int {
        return x % y == 0 ? y : gcd(y, x % y)
    }
    func lcm(_ x: Int, _ y: Int) -> Int {
        return x * y / gcd(x, y)
    }
    
    var result = 1 // 최소공배수 항등원 1
    for a in arr {
        result = lcm(result, a)
    }
    return result
}
