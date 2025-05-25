// 패턴매칭: 접두+접미+!길이!
import Foundation

let N = Int(readLine()!)!
let pattern = readLine()!.components(separatedBy: "*")
let (front, rear) = (pattern[0], pattern[1])

for _ in 0..<N {
    let name = readLine()!
    if name.hasPrefix(front) && name.hasSuffix(rear) && name.count >= front.count + rear.count {
        print("DA")
    } else {
        print("NE")
    }
}

