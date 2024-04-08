// 시간 범위 포함
import Foundation

func timeToInt(_ str: String) -> Int {
    let spl = str.split(separator: ":").map { Int($0)! }
    return 60*spl[0]+spl[1]
}

let line = readLine()!.components(separatedBy: " ")
let (a,b,c) = (timeToInt(line[0]), timeToInt(line[1]), timeToInt(line[2]))

var come = Set<String>()
var out = Set<String>()
while true {
    guard let li = readLine(), li != "" else { break }
    
    let spl = li.components(separatedBy: " ")
    let (time, name) = (timeToInt(spl[0]), spl[1])
    
    if (0...a)~=time {
        come.insert(name)
    } else if (b...c)~=time {
        out.insert(name)
    }
}

print(come.intersection(out).count)

