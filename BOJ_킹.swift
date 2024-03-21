// 체스 움직이기
import Foundation

let book: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H"]
let line = readLine()!.components(separatedBy: " ")

func pos(_ str: String) -> [Int] {
    return [8 - Int(String(str.last!))!, book.firstIndex(of: str.first!)!]
}


let dxy = ["R": [0, 1], "L": [0, -1], "B": [1, 0], "T": [-1, 0], "RT": [-1, 1], "LT": [-1, -1], "RB": [1, 1], "LB": [1, -1]]
func valid(_ p: [Int]) -> Bool {
    return (0..<8)~=p[0] && (0..<8)~=p[1]
}

var (king, stone, N) = (pos(line[0]), pos(line[1]), Int(line[2])!)
for _ in 0..<N {
    let d = dxy[readLine()!]!
    let nextKing = [king[0]+d[0], king[1]+d[1]]
    let nextStone = (nextKing == stone) ? [stone[0]+d[0], stone[1]+d[1]] : stone
    
    if valid(nextKing) && valid(nextStone) {
        (king, stone) = (nextKing, nextStone)
    }
}

print("\(book[king[1]])\(8-king[0])")
print("\(book[stone[1]])\(8-stone[0])")


