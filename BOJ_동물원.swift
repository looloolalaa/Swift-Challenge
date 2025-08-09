// 위에서 내려온 경우의수
let N = Int(readLine()!)!

var (a, b) = (1, 2)
for _ in 0..<N {
    (a, b) = ((a + b) % 9901, (2*a + b) % 9901)
}

print(a)
