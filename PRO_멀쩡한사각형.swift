// lose == n + m - 1
import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    
    func gcd(_ x: Int, _ y: Int) -> Int {
        if x % y == 0 { return y }
        return gcd(y, x % y)
    }
    
    let divisor = gcd(w, h)
    let (a, b) = (w / divisor, h / divisor)
    let lose = (a + b - 1) * divisor
    
    return Int64(w*h - lose)
}
