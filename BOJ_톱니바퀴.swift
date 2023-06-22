// 전파 왼쪽 오른쪽
import Foundation

var table: [[Character]] = []
for _ in 0..<4 {
    table.append(Array(readLine()!))
}
let K = Int(readLine()!)!
var commands: [[Int]] = []
for _ in 0..<K {
    commands.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

func go(_ num: Int, _ d: Int) {
    var rotate = [0, 0, 0, 0]
    rotate[num] = d
    
    var (i, j) = (num, num)
    while i >= 1 && table[i][6] != table[i-1][2] {
        rotate[i-1] = -rotate[i]
        i -= 1
    }
    while j <= 2 && table[j][2] != table[j+1][6] {
        rotate[j+1] = -rotate[j]
        j += 1
    }
    
    for num in 0..<4 {
        if rotate[num] == -1 {
            table[num].append(table[num].remove(at: 0))
        } else if rotate[num] == 1 {
            table[num].insert(table[num].removeLast(), at: 0)
        }
    }
    
}

for com in commands {
    go(com[0]-1, com[1])
}

var result = 0
result += (table[0][0] == "0") ? 0 : 1
result += (table[1][0] == "0") ? 0 : 2
result += (table[2][0] == "0") ? 0 : 4
result += (table[3][0] == "0") ? 0 : 8
print(result)
