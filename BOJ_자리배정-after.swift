// 나선형 회전
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (C, R) = (line[0], line[1])
let N = Int(readLine()!)!

var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: C), count: R)
func valid(_ a: Int, _ b: Int) -> Bool {
    return (0..<R)~=a && (0..<C)~=b
}

let dxy = [[-1, 0], [0, 1], [1, 0], [0, -1]]
var d = 0

var n = 1
var (a, b) = (R-1, 0)
while n <= C*R {
    while valid(a, b) && arr[a][b] == 0 {
        arr[a][b] = n
        if n == N { print(b+1, R-a); exit(0) }
        n += 1
        (a, b) = (a+dxy[d][0], b+dxy[d][1])
    }
    (a, b) = (a-dxy[d][0], b-dxy[d][1])
    
    d = (d+1)%4
    (a, b) = (a+dxy[d][0], b+dxy[d][1])
}

print(0)
