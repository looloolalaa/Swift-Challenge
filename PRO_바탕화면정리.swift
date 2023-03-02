// 모든점을 포함하는 최소 사각형
import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper = wallpaper.map { Array($0) }
    let (n, m) = (wallpaper.count, wallpaper[0].count)
    var (minX, minY, maxX, maxY) = (51, 51, -1, -1)
    
    for i in 0..<n {
        for j in 0..<m {
            if wallpaper[i][j] == "#" {
                (minX, minY) = (min(minX, i), min(minY, j))
                (maxX, maxY) = (max(maxX, i), max(maxY, j))
            }
        }
    }
    
    return [minX, minY, maxX+1, maxY+1]
}
