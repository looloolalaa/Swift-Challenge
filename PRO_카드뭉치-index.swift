// moving index
import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var (i, j, k) = (0, 0, 0)
    while k < goal.count {
        let target = goal[k]
        if i < cards1.count && cards1[i] == target {
            i += 1
        } else if j < cards2.count && cards2[j] == target {
            j += 1
        } else {
            return "No"
        }
        k += 1
    }
    return "Yes"
}
