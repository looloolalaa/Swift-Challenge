//Stack
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stack: [[Int]] = Array(repeating: [], count: board.count)
    var right_stack: [Int] = []
    for b in board.reversed() {
        for (i, v) in b.enumerated() {
            if v != 0 { stack[i].append(v) }
        }
    }
    
    var result = 0
    for move in moves {
        if let removed = stack[move-1].popLast() {
            if right_stack.last == removed {
                result += 1
                right_stack.removeLast()
            } else {
                right_stack.append(removed)
            }
        }
    }
    return 2*result
}
