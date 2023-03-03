// 그리디
import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var now = section[0]
    var counter = 0
    
    for s in section {
        if s >= now {
            counter += 1
            now = s + m
        }
    }
    
    return counter
}
