// 구간(범위) 문제
import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted { ($0[1], $0[0]) < ($1[1], $1[0]) }
    var missile = 0
    var result = 0
    for target in targets {
        if missile <= target[0] {
            missile = target[1]
            result += 1
        }
    }
    return result
}


