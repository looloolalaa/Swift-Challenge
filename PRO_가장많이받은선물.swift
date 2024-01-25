// 구현 문제
import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    let n = friends.count
    var ids: [String: Int] = [:]
    for i in 0..<n {
        ids[friends[i]] = i
    }
    
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var points = Array(repeating: 0, count: n)
    for gift in gifts {
        let line = gift.components(separatedBy: " ")
        let (a, b) = (ids[line[0]]!, ids[line[1]]!)
        table[a][b] += 1
        points[a] += 1
        points[b] -= 1
    }
    
    var answer = Array(repeating: 0, count: n)
    for i in 0..<n {
        for j in 0..<n {
            if i < j {
                let (give, take) = (table[i][j], table[j][i])
                if give > take { answer[i] += 1 }
                else if give < take { answer[j] += 1 }
                else {
                    if points[i] > points[j] { answer[i] += 1 }
                    else if points[i] < points[j] { answer[j] += 1 }
                }
            }
        }
    }
    
    return answer.max()!
}
