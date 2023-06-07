// 오른쪽 끝점 포함X
import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var total = Array(repeating: 0, count: 200+1)
    for line in lines {
        total[line[0]+100] += 1
        total[line[1]+100] -= 1
    }
    
    for i in 1..<total.count {
        total[i] += total[i-1]
    }
    
    return total.filter { $0 >= 2 }.count
}
