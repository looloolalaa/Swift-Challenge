// allSatisfy is SLOW!!!!
import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    var board = Array(repeating: -1, count: n)
    
    func put(_ i: Int) {
        func isValid(_ q: Int) -> Bool {
            // return (0..<i).allSatisfy { j in
            //     board[j] != q && abs(board[j] - q) != (i - j)
            // }
            for j in 0..<i {
                if board[j] == q || abs(board[j] - q) == (i - j) {
                    return false
                }
            }
            return true
        }
    
        if i == n {
            // print(board)
            result += 1
            return
        }
        
        for q in (0..<n) {
            if isValid(q) {
                board[i] = q
                put(i+1)
            }
        }
        
    }
    
    put(0)
    return result
}
