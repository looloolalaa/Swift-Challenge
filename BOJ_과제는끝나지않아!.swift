// 과제 stack
var res = 0
let N = Int(readLine()!)!
var stack: [[Int]] = []
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    if line[0] == 1 {
        stack.append([line[1], line[2]])
    }
    if !stack.isEmpty {
        stack[stack.count-1][1] -= 1
        if stack.last![1] == 0 {
            res += stack.removeLast()[0]
        }
    }
}

print(res)
