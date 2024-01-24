// 그래프 (out, in) 개수 규칙성 문제
import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    var counter: [Int: [Int]] = [:]
    for edge in edges {
        counter[edge[0], default: [0, 0]][0] += 1
        counter[edge[1], default: [0, 0]][1] += 1
    }
    
    var answer = [0, 0, 0, 0]
    for (i, c) in counter {
        if c[0] >= 2 && c[1] == 0 {
            answer[0] = i
        } else if c[0] == 0 && c[1] > 0 {
            answer[2] += 1
        } else if c[0] == 2 && c[1] >= 2 {
            answer[3] += 1
        }
    }
    
    let allGraphCount = counter[answer[0]]![0]
    answer[1] = allGraphCount - answer[2] - answer[3]
    return answer
}
