// [%, /]
import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var visited = Set<String>()
    visited.insert(words[0])
    
    for i in 1..<words.count {
        if visited.contains(words[i]) || words[i-1].last! != words[i].first! {
            return [i % n + 1, i / n + 1]
        }
        visited.insert(words[i])
    }
    
    return [0, 0]
}
