// 모든 스택이 내림차순이라면
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

func valid(_ stack: [Int]) -> Bool {
    for i in 0..<stack.count-1 {
        if stack[i] < stack[i+1] {
            return false
        }
    }
    return true
}

for _ in 0..<M {
    let _ = readLine()!
    let stack = readLine()!.split(separator: " ").map { Int($0)! }
    if !valid(stack) {
        print("No")
        exit(0)
    }
}

print("Yes")
