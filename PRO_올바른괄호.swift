// while "()" in s { replacing } => slow
// use stack
import Foundation

func solution(_ s:String) -> Bool {
    var stack: [Character] = []
    for c in s {
        if c == ")" && !stack.isEmpty && stack.last! == "(" {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }
    return stack.isEmpty ? true : false
}
