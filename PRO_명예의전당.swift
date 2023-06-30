// list insert
import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var result: [Int] = []
    var table: [Int] = []
    
    for s in score {
        var i = 0
        while i < table.count {
            if table[i] < s {
                break
            }
            i += 1
        }
        
        table.insert(s, at: i)
        if table.count > k {
            table.removeLast()
        }
        
        result.append(table.last!)
    }
    
    return result
}
