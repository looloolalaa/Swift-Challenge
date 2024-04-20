// 경사로 방문 처리
import Foundation

func valid(_ line: [Int]) -> Bool {
    var visited = Array(repeating: false, count: N)

    for i in 0..<N-1 {
        if line[i] == line[i+1] { continue }
        if abs(line[i]-line[i+1]) > 1 { return false }
        
        if line[i]-1 == line[i+1] {
            let first = line[i+1]
            for l in 0..<L {
                if i+1+l > N-1 || line[i+1+l] != first || visited[i+1+l] {
                    return false
                }
            }
            
            for l in 0..<L {
                visited[i+1+l] = true
            }
        } else if line[i]+1 == line[i+1] {
            let first = line[i]
            for l in 0..<L {
                if i-l < 0 || line[i-l] != first || visited[i-l] {
                    return false
                }
            }
            
            for l in 0..<L {
                visited[i-l] = true
            }
        }
    }
    
    return true
}


let spl = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L) = (spl[0], spl[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var res = 0
for li in arr {
    if valid(li) {
        res += 1
    }
}

for j in 0..<N {
    let li = (0..<N).map { arr[$0][j] }
    if valid(li) {
        res += 1
    }
}

print(res)
