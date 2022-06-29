//Counter with One Line
import Foundation

func solution(_ participant: [String], _ completion: [String]) -> String {
    
    var counter: [String: Int] = Dictionary(participant.map { ($0, 1) }, uniquingKeysWith: +)
    
    for c in completion {
        counter[c]! -= 1
        if counter[c] == 0 { counter.removeValue(forKey: c) }
    }
    return counter.keys.first!
}
