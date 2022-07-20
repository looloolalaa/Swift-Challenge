//basic N radix
import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var third: String = ""
    while n != 0 {
        third += String(n % 3)
        n /= 3
    }

    var answer = 0
    var m = third.count - 1
    for t in third {
        answer += Int(String(t))! * Int(pow(3.0, Double(m)))
        m -= 1
    }
    return answer
}
