// 무한히 -> 최소공배수
func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a%b)
}
func lcm(_ a: Int, _ b: Int) -> Int {
    return a*b/gcd(a, b)
}

let s1 = readLine()!
let s2 = readLine()!

let k = lcm(s1.count, s2.count)
if String(repeating: s1, count: k/s1.count) == String(repeating: s2, count: k/s2.count) {
    print(1)
} else {
    print(0)
}

