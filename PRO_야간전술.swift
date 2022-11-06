// (3, 2) 반복 => 나머지로 구간 구하기
// 1 <= i % 5 <= 3   ==> 3 구간
// 4 <= i % 5 <= 0   ==> 2 구간
import Foundation

func solution(_ distance:Int, _ scope:[[Int]], _ times:[[Int]]) -> Int {
    
    func catchPos(_ s: [Int], _ t: [Int]) -> Int {
        let (a, b) = (s.min()!, s.max()!)
        let pattern = t[0] + t[1]

        for i in a...b {
            let r = i % pattern
            if 1 <= r && r <= t[0] {
                return i
            }
        }
        return -1
    }
    
    var maxDis = distance
    for (s, t) in zip(scope, times) {
        let pos = catchPos(s, t)
        if pos != -1 {
            maxDis = min(maxDis, pos)
        }
    }
    
    return maxDis
}
