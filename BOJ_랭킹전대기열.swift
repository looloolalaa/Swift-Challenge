// 방 구현
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (p, m) = (line[0], line[1])

var room: [[(Int, String)]] = []

for _ in 0..<p {
    let li = readLine()!.components(separatedBy: " ")
    let (level, name) = (Int(li[0])!, li[1])
    
    var enter = false
    for (i, r) in room.enumerated() {
        if r.count < m && ((r.first!.0-10)...(r.first!.0+10))~=level {
            room[i].append((level, name))
            enter = true
            break
        }
    }
    
    if !enter {
        room.append([(level, name)])
    }
}

for r in room {
    print(r.count == m ? "Started!" : "Waiting!")
    for (l, n) in r.sorted(by: { $0.1 < $1.1 }) {
        print(l, n)
    }
}
