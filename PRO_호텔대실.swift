// 범위 누적합
import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var times = Array(repeating: 0, count: 24*60 + 12)
    
    func timeToInt(_ s: String) -> Int {
        let sp = s.split(separator: ":").map { String($0) }
        return Int(sp[0])! * 60 + Int(sp[1])!
    }
    
    for book in book_time {
        times[timeToInt(book[0])] += 1
        times[timeToInt(book[1]) + 10] -= 1
    }
    
    for i in 1..<times.count {
        times[i] += times[i-1]
    }
    
    return times.max()!
}
