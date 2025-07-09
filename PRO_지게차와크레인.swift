// 테두리 dfs
import Foundation

func solution(_ storage:[String], _ requests:[String]) -> Int {
    let (n, m) = (storage.count, storage[0].count)
    let empty: [Character] = Array(repeating: "0", count: m+2)
    var board: [[Character]] = [empty]
    for line in storage {
        board.append(["0"]+Array(line)+["0"])
    }
    board.append(empty)
    
    func skill(_ str: String) {
        let target = str.first!
        for i in 0..<n+2 {
            for j in 0..<m+2 {
                if board[i][j] == target {
                    board[i][j] = "0"
                }
            }
        }
    }
    
    let dxy = [[0,1], [1,0], [0,-1], [-1,0]]
    func valid(_ x: Int, _ y: Int) -> Bool {
        return (0..<n+2)~=x && (0..<m+2)~=y
    }
    
    func normal(_ ch: String) {
        let target = ch.first!
        
        var willRemoved: [(Int, Int)] = []
        var visited = Array(repeating: Array(repeating: false, count: m+2), count: n+2)
        
        func dfs(_ x: Int, _ y: Int) {
            for d in dxy {
                let (a, b) = (x+d[0], y+d[1])
                if valid(a, b) && !visited[a][b] {
                    if board[a][b] == "0" {
                        visited[a][b] = true
                        dfs(a, b)
                    } else if board[a][b] == target {
                        visited[a][b] = true
                        willRemoved.append((a, b))
                    }
                }
            }
        }
        
        visited[0][0] = true
        dfs(0, 0)
        
        for (x, y) in willRemoved {
            board[x][y] = "0"
        }
    }
    
    for req in requests {
        if req.count == 1 {
            normal(req)
        } else if req.count == 2 && req.first! == req.last! {
            skill(req)
        }
        
        // for b in board {
        //     print(String(b.map { $0 == "0" ? " " : $0 }))
        // }
        // print()
    }
    
    var ans = 0
    for i in 0..<n+2 {
        for j in 0..<m+2 {
            if board[i][j] != "0" {
                ans += 1
            }
        }
    }
    return ans
}
