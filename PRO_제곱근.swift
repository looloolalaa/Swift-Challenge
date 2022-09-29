// sqrt * sqrt
import Foundation

func solution(_ n:Int64) -> Int64 {
    let sq = Int64(sqrt(Double(n)))
    return sq*sq == n ? (sq+1)*(sq+1) : -1
}
