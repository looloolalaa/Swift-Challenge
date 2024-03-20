// 조건 체스
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

if N == 1 {
    print(1)
} else if N == 2 {
    print(min(4, (M+1)/2))
} else if M < 7 {
    print(min(4, M))
} else {
    print(M-7+5)
}
