// 3방향 DP
import Foundation

func solution(_ board:[[Int]]) -> Int {
    let (row, col) = (board.count, board[0].count)
    if row == 1 || col == 1 {
        for line in board {
            if line.contains(1) { return 1 }
        }
        return 0
    }
    
    var maxi = 0
    var board = board
    for i in 1..<row {
        for j in 1..<col {
            if board[i][j] != 0 {
                board[i][j] = min(board[i-1][j-1], board[i-1][j], board[i][j-1]) + 1
                maxi = max(maxi, board[i][j])
            }
        }
    }
    return maxi * maxi
}
