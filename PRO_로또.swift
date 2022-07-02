//filter + map
import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    let correct: Int = lottos.filter { win_nums.contains($0) }.count
    let zero: Int = lottos.filter { $0 == 0 }.count
    
    let maxMin = [correct + zero, correct]
    return maxMin.map { $0 < 2 ? 6: (7-$0) }
}
