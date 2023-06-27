// 범위 약수 개수
import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var book = Array(repeating: 0, count: 100_001)
    
    for i in 1...100_000 {
        var num = i
        while num <= 100_000 {
            book[num] += 1
            num += i
        }
    }
    
    var result = 0
    for b in book[...number] {
        if b > limit {
            result += power
        } else {
            result += b
        }
    }
    return result
}
