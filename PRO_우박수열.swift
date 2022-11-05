// s[b] - s[a]
import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var s: [Double] = []
    var pos: [Int] = []
    
    var k = k
    while true {
        pos.append(k)
        if k == 1 { break }
        k = k % 2 == 0 ? k/2 : 3*k + 1
    }
    
    s.append(0)
    for x in 1..<pos.count {
        s.append(s.last! + Double(pos[x-1]) + Double(pos[x] - pos[x-1])/2)
    }
    
    return ranges.map { r in
        let (a, b) = (r[0], r[1])
        let new_b = pos.count-1+b
        if a > new_b { return -1.0 }
        return s[new_b] - s[a]
    }
}
