// set dp
import Foundation

let NSM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, S, M) = (NSM[0], NSM[1], NSM[2])
let V = readLine()!.split(separator: " ").map { Int($0)! }


var s = Set([S])

for v in V {
    var new_s = Set<Int>()
    for p in s {
        if p - v >= 0 { new_s.insert(p - v) }
        if p + v <= M { new_s.insert(p + v) }
    }
    
    if new_s.isEmpty { print(-1); exit(0) }
    s = new_s
}

print(s.max()!)
