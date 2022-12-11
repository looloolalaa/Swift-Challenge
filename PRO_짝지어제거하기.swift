// string stack
import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    for c in Array(s) {
        if stack.isEmpty { stack.append(c) }
        else {
            if stack.last! == c { stack.removeLast() }
            else { stack.append(c) }
        }
    }
    return stack.isEmpty ? 1 : 0
}
