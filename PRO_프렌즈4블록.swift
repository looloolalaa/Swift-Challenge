// 테트리스 블록 내리기
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var board = board.map { Array($0) }
    
    func removed() -> Set<[Int]> {
        var s = Set<[Int]>()
        
        for i in (0..<m-1) {
            for j in (0..<n-1) {
                let now = board[i][j]
                if now != "-" && board[i+1][j] == now && board[i][j+1] == now && board[i+1][j+1] == now {
                    s.insert([i, j])
                    s.insert([i+1, j])
                    s.insert([i, j+1])
                    s.insert([i+1, j+1])
                }
            }
        }
        
        return s
    }
    
    func down() {
        for j in (0..<n) {
            var temp: [Character] = []
            for i in (0..<m) {
                if board[i][j] != "-" {
                    temp.append(board[i][j])
                }
            }

            for i in 0..<(m - temp.count) {
                board[i][j] = "-"
            }
            for i in (0..<temp.count) {
                board[i + m - temp.count][j] = temp[i]
            }
        }
    }
    
    var xySet = removed()
    while xySet.count != 0 {
        for xy in xySet {
            board[xy[0]][xy[1]] = "-"
        }
        down()
        xySet = removed()
    }
    
    var answer = 0
    for i in (0..<m) {
        for j in (0..<n) {
            if board[i][j] == "-" {
                answer += 1
            }
        }
    }
    return answer
}


// "CCBDE",
// "AAADE",
// "AAABF",
// "CCBBF"
