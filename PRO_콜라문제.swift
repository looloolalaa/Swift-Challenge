// 몫나머지
import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var n = n
    var result = 0
    while n >= a {
        let earn = ((n / a) * b)
        result += earn
        n = earn + (n % a)
    }
    
    return result
}
