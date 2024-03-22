// 5개씩 대보기
import Foundation

var arr: [[Int]] = []
for _ in 0..<19 {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dxy = [[0, 1], [1, 0], [1, 1], [-1, 1]]
func valid(_ a: Int, _ b: Int) -> Bool {
    return (0..<19)~=a && (0..<19)~=b
}

for i in 0..<19 {
    for j in 0..<19 {
        if arr[i][j] == 0 { continue }
        let stone = arr[i][j]
        for d in dxy {
            let five = (0..<5).map { (i+d[0]*$0, j+d[1]*$0) }
            if five.allSatisfy({ (i, j) in valid(i, j) && arr[i][j] == stone }) {
                let front = (i-d[0], j-d[1])
                if valid(front.0, front.1) && arr[front.0][front.1] == stone {
                    continue
                }
                
                let rear = (i+d[0]*5, j+d[1]*5)
                if valid(rear.0, rear.1) && arr[rear.0][rear.1] == stone {
                    continue
                }
                
                print(stone)
                print(i+1, j+1)
                exit(0)
            }
        }
    }
}

print(0)
