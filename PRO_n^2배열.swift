// position XY
// i == num/n
// j == num%n
import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    return (Int(left)...Int(right)).map { num in
        let (i, j) = (num / n, num % n)
        return max(i, j) + 1
    }
}
