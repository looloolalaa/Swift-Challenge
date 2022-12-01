// 4 recursion
import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    let n = arr.count
    
    func zeroOne(_ p: [Int]) -> [Int] {
        let (x1, y1, x2, y2) = (p[0], p[1], p[2], p[3])
        let first = arr[x1][y1]
        for i in (x1...x2) {
            for j in (y1...y2) {
                if arr[i][j] != first {
                    let center = [(x1 + x2) / 2, (y1 + y2) / 2]
                    let leftUp = zeroOne([x1, y1, center[0], center[1]])
                    let rightUp = zeroOne([x1, center[1]+1, center[0], y2])
                    let leftDown = zeroOne([center[0]+1, y1, x2, center[1]])
                    let rightDown = zeroOne([center[0]+1, center[1]+1, x2, y2])
                    
                    return [leftUp[0] + rightUp[0] + leftDown[0] + rightDown[0],
                           leftUp[1] + rightUp[1] + leftDown[1] + rightDown[1]]
                }
            }
        }
        
        return first == 0 ? [1, 0] : [0, 1]
    }
    
    return zeroOne([0, 0, n-1, n-1])
}
