import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var result = 0
    var budget = budget
    for i in d.sorted() {
        if i > budget { return result }
        else {
            budget -= i
            result += 1
        }
    }
    return result
}
