// 소수점 아래 있는가? a == floor(a)
import Foundation

func solution(_ n:Int) -> Int {
    let root = sqrt(Double(n))
    return root == floor(root) ? 1 : 2
}
