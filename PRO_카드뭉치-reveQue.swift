// reversed Queue - only pop
import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var (cards1, cards2, goal) = (Array(cards1.reversed()), Array(cards2.reversed()), Array(goal.reversed()))
    while !goal.isEmpty {
        let target = goal.last!
        if !cards1.isEmpty && cards1.last! == target {
            cards1.removeLast()
        } else if !cards2.isEmpty && cards2.last! == target {
            cards2.removeLast()
        } else {
            return "No"
        }
        goal.removeLast()
    }
    return "Yes"
}
