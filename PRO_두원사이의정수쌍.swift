// 원 공식
import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var rightUpCount: Int64 = 0
    for x in 1...r2 {
        let y1 = (x <= r1) ? sqrt(Double(r1*r1) - Double(x*x)) : 0
        let y2 = sqrt(Double(r2*r2) - Double(x*x))
        
        rightUpCount += Int64(floor(y2) - ceil(y1) + 1)
    }
    
    return rightUpCount * 4
}

// y = sqrt(4-x^2)
