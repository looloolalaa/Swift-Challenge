// xy set
import Foundation

func solution(_ dirs:String) -> Int {
    var p = [0, 0]
    let dxy: [Character: [Int]] = ["U": [0, 1], "D": [0, -1], "R": [1, 0], "L": [-1, 0]]
    
    var visited = Set<[Int]>()
    for d in dirs {
        let np = [p[0] + dxy[d]![0], p[1] + dxy[d]![1]]
        if -5 <= np[0] && np[0] <= 5 && -5 <= np[1] && np[1] <= 5 {
            visited.insert([p[0], p[1], np[0], np[1]])
            visited.insert([np[0], np[1], p[0], p[1]])
            p = np
        }
    }
    
    return visited.count / 2
}
