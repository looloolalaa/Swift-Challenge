// 모든 후보 탐색 X
// 목적지에서 부터 거꾸로 범위 계산
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    var xQueries: [[Int]] = []
    var yQueries: [[Int]] = []
    for q in queries {
        if q[0] <= 1 {
            yQueries.append(q)
        } else {
            xQueries.append(q)
        }
    }
    
    var (yMin, yMax) = (y, y)
    while !yQueries.isEmpty {
        let q = yQueries.removeLast()
        if q[0] == 0 {
            yMax += q[1]
            if yMin != 0 {
                yMin += q[1]
            }
        } else {
            yMin -= q[1]
            if yMax != (m-1) {
                yMax -= q[1]
            }
        }
        
        if (yMin < 0 && yMax < 0) || (m <= yMin && m <= yMax) {
            return 0
        }
        
        if yMin < 0 { yMin = 0 }
        if yMax >= m { yMax = m-1 }
    }
    
    var (xMin, xMax) = (x, x)
    while !xQueries.isEmpty {
        let q = xQueries.removeLast()
        if q[0] == 2 {
            xMax += q[1]
            if xMin != 0 {
                xMin += q[1]
            }
        } else {
            xMin -= q[1]
            if xMax != (n-1) {
                xMax -= q[1]
            }
        }
        
        if (xMin < 0 && xMax < 0) || (n <= xMin && n <= xMax) {
            return 0
        }
        
        if xMin < 0 { xMin = 0 }
        if xMax >= n { xMax = n-1 }
    }
    
    return Int64((xMax - xMin + 1) * (yMax - yMin + 1))
}
