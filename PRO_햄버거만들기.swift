// let temp = suffix .. ?
import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    func isValid() -> Bool {
        if stack.count <= 3 { return false }

        let endIndex = stack.endIndex
        return stack[(endIndex-4)...] == [1, 2, 3, 1] //suffix
    }

    var result = 0
    for i in ingredient {
        stack.append(i)
        if isValid() {
            result += 1
            stack.removeLast(4)

        }
    }
    return result
}
