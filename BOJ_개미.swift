// 위치바꾸기
import Foundation

let inp = readLine()!.components(separatedBy: " ")
let (N1, N2) = (Int(inp[0])!, Int(inp[1])!)

var a = Set<String>()
var b = Set<String>()
var line: [String] = [""]

for c in readLine()!.reversed() {
    line.append(String(c))
    a.insert(String(c))
}

for c in readLine()! {
    line.append(String(c))
    b.insert(String(c))
}
line.append("")

let T = Int(readLine()!)!



func jump() {
    var target: [Int] = []
    for i in 1..<line.count-1 {
        if a.contains(line[i]) {
            if b.contains(line[i+1]) {
                target.append(i)
            }
        }

    }

    for i in target {
        (line[i], line[i+1]) = (line[i+1], line[i])
    }
}

for _ in 0..<T {
    jump()
}
print(line.joined())
