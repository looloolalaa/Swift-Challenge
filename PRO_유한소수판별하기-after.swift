// 소인수가 2와 5로만 이루어져있는가??
import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a % b == 0 { return b }
        return gcd(b, a % b)
    }
    
    var b = b / gcd(a,b)
    
    while b % 2 == 0 {
        b /= 2
    }
    while b % 5 == 0 {
        b /= 5
    }
    
    return (b == 1) ? 1 : 2
}
