// 연속으로 같은 돌 개수 세기
import Foundation

var arr: [[Int]] = []
for _ in 0..<19 {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dxy = [[0, 1], [1, 0], [1, 1], [-1, 1]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<19)~=i && (0..<19)~=j
}

func check(_ i: Int, _ j: Int, _ d: Int) -> Int {
    var len = 0
    let stone = arr[i][j]
    var (a, b) = (i, j)
    while valid(a, b) && arr[a][b] == stone {
        len += 1
        (a, b) = (a+dxy[d][0], b+dxy[d][1])
    }
    return len
}

for i in 0..<19 {
    for j in 0..<19 {
        if arr[i][j] == 0 { continue }
        for d in 0..<4 {
            if check(i, j, d) == 5 {
                let front = (i-dxy[d][0], j-dxy[d][1])
                if valid(front.0, front.1) && arr[front.0][front.1] == arr[i][j] {
                    continue
                }
                
                print(arr[i][j])
                print(i+1, j+1)
                exit(0)
            }
        }
    }
}

print(0)
