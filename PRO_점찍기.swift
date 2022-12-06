// circle
import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    
    func f(_ x: Int) -> Double {
        return sqrt(Double(d*d - x*x))
    }
    
    var total = 0
    for i in stride(from: 0, through: d, by: k) {
        total += Int(floor(f(i))) / k + 1
    }
    return Int64(total)
}
