// n: 10억 -> logn
import Foundation

func solution(_ n:Int) -> Int
{
    var n = n
    var ans: Int = 0
    while n > 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            ans += 1
        }
    }
    return ans
}

// 2500
// 1250
// 625
// 624 +1
// 312
// 106
// 53
// 52 +1
// 26
// 13
// 12 +1
// 6
// 3
// 2 +1
// 1 +1
