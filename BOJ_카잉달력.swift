// 최소 공배수
func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a%b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a*b/gcd(a,b)
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    var (M, N, x, y) = (line[0], line[1], line[2], line[3])
    if M > N {
        (M, N) = (N, M)
        (x, y) = (y, x)
    }
    var num = y
    
    if x == M { x = 0 }
    if y == N { y = 0 }

    var isBreak = false
    while num <= lcm(M, N) {
        if num % M == x {
            print(num)
            isBreak = true
            break
        }
        
        num += N
    }
    
    if !isBreak {
        print(-1)
    }
}

