// 좌표배열 사용하지 않고 set 사용 풀이도 가능
import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var table: [[[Bool]]] = Array(repeating: Array(repeating: [false, false], count: n+1), count: n+1)
    
    func valid(_ x: Int, _ y: Int, _ a: Int) -> Bool {
        if table[x][y][a] == false {
            return true
        }
        
        if a == 0 {
            return y == 0 || table[x][y][1] || (x != 0 && table[x-1][y][1]) || (y != 0 && table[x][y-1][0])
        } else if a == 1 {
            return table[x][y-1][0] || table[x+1][y-1][0] || (x != 0 && x != n && table[x-1][y][1] && table[x+1][y][1])
        }
        return false
    }
    
    for build in build_frame {
        let (x, y, a, b) = (build[0], build[1], build[2], build[3])
        if b == 1 {
            table[x][y][a] = true
            if !valid(x, y, a) {
                table[x][y][a] = false
            }
        }
        else if b == 0 {
            table[x][y][a] = false
            var allValid = true
            for i in 0..<(n+1) {
                for j in 0..<(n+1) {
                    if !valid(i, j, 0) || !valid(i, j, 1) {
                        allValid = false
                        break
                    }
                }
                // if !allValid { break }
            }
            
            if !allValid {
                table[x][y][a] = true
            }
        }
    }
    
    var result: [[Int]] = []
    for j in 0..<(n+1) {
        for i in 0..<(n+1) {
            if table[j][i][0] {
                result.append([j, i, 0])
            }
            if table[j][i][1] {
                result.append([j, i, 1])
            }
        }
    }
    
    return result
}
