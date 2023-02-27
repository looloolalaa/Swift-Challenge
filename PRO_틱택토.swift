// 조건 구현 잘 판단하기
import Foundation

func solution(_ board:[String]) -> Int {
    let board = board.map { Array($0) }
    var (oCount, xCount) = (0, 0)
    for i in 0..<3 {
        for j in 0..<3 {
            if board[i][j] == "O" {
                oCount += 1
            }
            if board[i][j] == "X" {
                xCount += 1
            }
        }
    }
    
    func oxWin(_ ch: Character) -> Bool {
        for i in 0..<3 {
            if board[i].allSatisfy({ $0 == ch }) {
                return true
            }
        }
        
        for j in 0..<3 {
            var temp: [Character] = []
            for i in 0..<3 {
                temp.append(board[i][j])
            }
            
            if temp.allSatisfy({ $0 == ch }) {
                return true
            }
        }
        
        if board[0][2] == ch && board[1][1] == ch && board[2][0] == ch {
            return true
        }
        if board[0][0] == ch && board[1][1] == ch && board[2][2] == ch {
            return true
        }
        
        return false
    }
    
    
    if !(oCount == xCount || oCount == xCount + 1) {
        return 0
    }
    
    if oxWin("O") && oCount != xCount + 1 {
        return 0
    }
    if oxWin("X") && oCount != xCount {
        return 0
    }
    
    return 1
}
