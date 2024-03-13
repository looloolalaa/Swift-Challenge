// 괄호 검사
import Foundation

let str = readLine()!
var stack: [String] = []
for c in str {
    if c == "(" || c == "[" {
        stack.append(String(c))
    } else if c == ")" {
        if stack.isEmpty { print(0); exit(0) }
        else if stack.last! == "(" {
            stack.removeLast()
            var x = 2
            while !stack.isEmpty, let n = Int(stack.last!) {
                x += n
                stack.removeLast()
            }
            stack.append(String(x))
        } else if (stack.count >= 2 && stack[stack.count-2] == "("), let n = Int(stack.last!) {
            stack.removeLast()
            stack.removeLast()
            var x = n*2
            while !stack.isEmpty, let n = Int(stack.last!) {
                x += n
                stack.removeLast()
            }
            stack.append(String(x))
        } else {
            print(0); exit(0)
        }
    } else if c == "]" {
        if stack.isEmpty { print(0); exit(0) }
        else if stack.last! == "[" {
            stack.removeLast()
            var x = 3
            while !stack.isEmpty, let n = Int(stack.last!) {
                x += n
                stack.removeLast()
            }
            stack.append(String(x))
        } else if (stack.count >= 2 && stack[stack.count-2] == "["), let n = Int(stack.last!) {
            stack.removeLast()
            stack.removeLast()
            var x = n*3
            while !stack.isEmpty, let n = Int(stack.last!) {
                x += n
                stack.removeLast()
            }
            stack.append(String(x))
        } else {
            print(0); exit(0)
        }
    }
    
}


if stack.count == 1, let n = Int(stack.last!) {
    print(n)
} else {
    print(0)
}
