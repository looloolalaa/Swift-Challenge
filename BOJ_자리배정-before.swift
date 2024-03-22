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
while n < C*R {
    while true {
        let (na, nb) = (a+dxy[d][0], b+dxy[d][1])
        if !valid(na, nb) || arr[na][nb] != 0 {
            break
        }
        arr[a][b] = n
        n += 1
        (a, b) = (na, nb)
    }
    
    d = (d+1)%4
}
arr[a][b] = C*R

for i in 0..<R {
    for j in 0..<C {
        if arr[i][j] == N {
            print(j+1, R-i)
            exit(0)
        }
    }
}

print(0)
