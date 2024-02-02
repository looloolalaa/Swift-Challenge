// dp
import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    var a = Array(repeating: 0, count: n)
    var b = Array(repeating: 0, count: n)
    
    a[0] = 1
    b[0] = (tops[0] == 1) ? 3 : 2
    
    for i in 1..<n {
        if tops[i] == 1 {
            a[i] = (a[i-1]*1 + b[i-1]*1) % 10007
            b[i] = (a[i-1]*2 + b[i-1]*3) % 10007
        } else {
            a[i] = (a[i-1]*1 + b[i-1]*1) % 10007
            b[i] = (a[i-1]*1 + b[i-1]*2) % 10007
        }
    }
    
    return (a[n-1] + b[n-1]) % 10007
}

