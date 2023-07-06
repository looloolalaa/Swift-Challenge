// 입력 개수 모를 때
import Foundation

var result: [Int] = []
while let line = readLine() {
    let inp = line.components(separatedBy: " ").map { Int($0)! }
    result.append(inp[0]+inp[1])
}

for r in result {
    print(r)
}
