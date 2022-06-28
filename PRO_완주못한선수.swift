//Counter using Normal dict
import Foundation

func solution(_ participant: [String], _ completion: [String]) -> String {
    var book: [String: Int] = [:]
    for p in participant {
        book[p, default: 0] += 1
    }
    
    for c in completion {
        book[c]! -= 1
    }
    
    for (k, v) in book {
        if v == 1 {
            return k
        }
    }
    return "no"
}
