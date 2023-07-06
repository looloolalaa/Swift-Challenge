// 사각형 대보기
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])
var board: [[Character]] = []
for _ in 0..<N {
    board.append(Array(readLine()!))
}

let line0 = Array("WBWBWBWB")
let line1 = Array("BWBWBWBW")

var first: [[Character]] = []
var second: [[Character]] = []
for _ in 0..<4 {
    first.append(line0)
    first.append(line1)
    
    second.append(line1)
    second.append(line0)
}

var res = 64
for i in 0..<N-8+1 {
    for j in 0..<M-8+1 {
        
        var (f, s) = (0, 0)
        for x in 0..<8 {
            for y in 0..<8 {
                if board[x+i][y+j] != first[x][y] {
                    f += 1
                }
                if board[x+i][y+j] != second[x][y] {
                    s += 1
                }
            }
        }
        res = min(res, min(f, s))
    }
}

print(res)


