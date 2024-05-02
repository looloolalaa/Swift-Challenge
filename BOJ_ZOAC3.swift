// 왼검지오른검지 움직이기
import Foundation

let keyboard = [
    ["q","w","e","r","t","y","u","i","o","p"],
    ["a","s","d","f","g","h","j","k","l"],
    ["z","x","c","v","b","n","m"]
]
var pos: [String: (Int, Int)] = [:]
for i in 0..<keyboard.count {
    for j in 0..<keyboard[i].count {
        pos[keyboard[i][j]] = (i, j)
    }
}
let lhs = "qwertasdfgzxcv"

var res = 0
let line = readLine()!.components(separatedBy: " ")
var (l, r) = (line[0], line[1])
for c in readLine()! {
    let (a, b) = pos[String(c)]!
    if lhs.contains(c) {
        let (i, j) = pos[l]!
        res += abs(i-a)+abs(j-b)+1
        l = String(c)
    } else {
        let (i, j) = pos[r]!
        res += abs(i-a)+abs(j-b)+1
        r = String(c)
    }
}

print(res)
