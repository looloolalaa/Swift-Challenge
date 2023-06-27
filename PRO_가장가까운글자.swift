// 최대값 딕셔너리
import Foundation

func solution(_ s:String) -> [Int] {
    var book: [Character: Int] = [:]
    var result: [Int] = []
    for (i, c) in s.enumerated() {
        if book[c] == nil {
            result.append(-1)
            book[c] = i
        } else {
            result.append(i - book[c]!)
            book[c] = i
        }
    }
    
    return result
}

