// 좌표포함 최소 직사각형
let T = Int(readLine()!)!
var results: [Int] = []
for _ in 0..<T {
    let command = readLine()!
    
    let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var d = 0
    var now = [0, 0]
    var xys = Set<[Int]>([[0, 0]])
    for c in command {
        if c == "F" {
            now = [now[0]+dxy[d][0], now[1]+dxy[d][1]]
            xys.insert(now)
        } else if c == "B" {
            now = [now[0]+dxy[(d+2)%4][0], now[1]+dxy[(d+2)%4][1]]
            xys.insert(now)
        } else if c == "R" {
            d = (d+1)%4
        } else if c == "L" {
            d = (d-1+4)%4
        }
    }

    let minX = xys.map { $0[0] }.min()!
    let maxX = xys.map { $0[0] }.max()!
    let minY = xys.map { $0[1] }.min()!
    let maxY = xys.map { $0[1] }.max()!

    results.append((maxX - minX)*(maxY - minY))
}


for r in results {
    print(r)
}




