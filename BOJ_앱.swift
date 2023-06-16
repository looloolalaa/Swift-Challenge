// 크기에 따른 딕셔너리 변화
import Foundation

let inp = readLine()!.components(separatedBy: " ")
let (N, M) = (Int(inp[0])!, Int(inp[1])!)

let memory = readLine()!.components(separatedBy: " ").map { Int($0)! }
let cost = readLine()!.components(separatedBy: " ").map { Int($0)! }

var maxi: [Int: Int] = [0: 0]
for (co, me) in zip(cost, memory) {
    for (c, m) in maxi {

        let newCost = co + c
        if maxi[newCost] == nil {
            maxi[newCost] = me + m
        } else {
            maxi[newCost] = max(maxi[newCost]!, me + m)
        }

    }
}

var result = 10000
for (c, m) in maxi {
    if m >= M {
        result = min(result, c)
    }
}
print(result)


