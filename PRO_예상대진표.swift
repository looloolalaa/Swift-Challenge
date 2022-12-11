// binary tree number
import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var (x, y) = (n+a-1, n+b-1)
    var result = 0
    while x != y {
        x /= 2
        y /= 2
        result += 1
    }
    return result
}
