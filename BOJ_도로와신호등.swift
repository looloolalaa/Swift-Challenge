// 나머지 반복
import Foundation

let inp = readLine()!.components(separatedBy: " ")
let (N, L) = (Int(inp[0])!, Int(inp[1])!)

var lights: [[Int]] = [[0, 0, 0]]
for _ in 0..<N {
    lights.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}
lights.append([L, 0, 0])

var time = 0
for i in 1..<lights.count {
    time += lights[i][0] - lights[i-1][0]
    if i == lights.count-1 { break }
    
    if time % (lights[i][1] + lights[i][2]) < lights[i][1] {
        time += lights[i][1] - time % (lights[i][1] + lights[i][2])
    }
    
}

print(time)
