// 한 숫자의 약수개수
import Foundation

func divCount(_ n: Int) -> Int {
    var result = 0
    let center = Int(sqrt(Double(n)))
    for i in (1..<(center + 1)){
        if n % i == 0 { result += 2 }
    }
    return center * center == n ? result - 1 : result
}
