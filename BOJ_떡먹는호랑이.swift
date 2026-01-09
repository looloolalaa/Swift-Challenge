// 피보나치 N번째 = Ax + By ?
var (a, b) = (1, 0)
var (c, d) = (0, 1)

let DK = readLine()!.split(separator: " ").map { Int($0)! }
let (D, K) = (DK[0], DK[1])
for _ in 0..<D-2 {
    let (e, f) = (a+c, b+d)
    (a, b) = (c, d)
    (c, d) = (e, f)
}

for i in 1...100000 {
    if (K-c*i) % d == 0 {
        print(i)
        print((K-c*i) / d)
        break
    }
}
