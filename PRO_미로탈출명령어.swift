// k 거리 만큼 움직이기
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var result = "impossible"
    
    func go(_ x: Int, _ y: Int, _ path: String) {
        if result != "impossible" { return }
        
        let canGo = k - path.count
        let dis = abs(r-x) + abs(c-y)
        
        if canGo < dis || (canGo - dis) % 2 == 1 { return }
        if canGo == 0 && dis == 0 {
            result = path
            return
        }
        
        if x < n { go(x+1, y, path+"d") }
        if 1 < y { go(x, y-1, path+"l") }
        if y < m { go(x, y+1, path+"r") }
        if 1 < x { go(x-1, y, path+"u") }
    }
    
    go(x, y, "")
    return result
}
// dlru
