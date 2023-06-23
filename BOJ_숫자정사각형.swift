// 정사각형 대보기
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])
var table: [[Character]] = []
for _ in 0..<N {
    table.append(Array(readLine()!))
}


func main() -> Int {
    var size = min(N, M)
    while size >= 1 {
        for i in 0..<N-size+1 {
            for j in 0..<M-size+1 {
                if table[i][j] == table[i][j+size-1] && table[i][j] == table[i+size-1][j] && table[i][j] == table[i+size-1][j+size-1] {
                    return size*size
                }
            }
        }
        size -= 1
    }
    return -1
}


print(main())




