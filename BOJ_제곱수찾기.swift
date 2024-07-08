// 좌표가 등차 수열
import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])
var arr: [[Character]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!))
}

func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i&&i<N && 0<=j&&j<M
}

func getCandi(_ x: Int, _ y: Int) -> [[(Int, Int)]] {
    var res: [[(Int, Int)]] = []
    for i in 0..<N {
        for j in 0..<M {
            if i == x && j == y { continue }
            
            var line = [(x, y), (i, j)]
            res.append(line)
            
            let (dx, dy) = (i-x, j-y)
            while true {
                let nxt = (line.last!.0+dx, line.last!.1+dy)
                if !valid(nxt.0, nxt.1) { break }
                
                line.append(nxt)
                res.append(line)
            }
            
        }
    }
    return res
}

func isSquareNum(_ n: Int) -> Bool {
    let sq = sqrt(Double(n))
    return sq == floor(sq)
}

var allCandis: [[(Int, Int)]] = []
for i in 0..<N {
    for j in 0..<M {
        allCandis.append([(i, j)])
        allCandis += getCandi(i, j)
    }
}

var ans = -1
for ijs in allCandis {
    let num = Int(String(ijs.map { ij in arr[ij.0][ij.1] }))!
    if isSquareNum(num) {
        ans = max(ans, num)
    }
}

print(ans)
