//String N radix
import Foundation

func solution(_ n:Int) -> Int {
    let third = String(n, radix: 3)
    return Int(String(third.reversed()), radix: 3)!
}
