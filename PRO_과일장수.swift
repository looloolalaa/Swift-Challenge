// 100_0000 sort
import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let score = score.sorted()
    
    var total = 0
    for i in stride(from: score.count-m, to: -1, by: -m) {
        total += score[i]
    }
    
    return total * m
}
