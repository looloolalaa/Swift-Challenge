// minI, minJ 로 좌표 맞추기
let _ = readLine()!
let dxy = [[1, 0], [0, -1], [-1, 0], [0, 1]]
var d = 0
var (i, j) = (0, 0)
var (minI, maxI) = (0, 0)
var (minJ, maxJ) = (0, 0)
var pos = Set<[Int]>([[0, 0]])
for c in readLine()! {
    if c == "R" { d = (d+1)%4 }
    if c == "L" { d = (d-1+4)%4 }
    if c == "F" {
        (i, j) = (i+dxy[d][0], j+dxy[d][1])
        pos.insert([i, j])
        minI = min(minI, i)
        maxI = max(maxI, i)
        minJ = min(minJ, j)
        maxJ = max(maxJ, j)
    }
}

let (width, height) = (maxJ - minJ + 1, maxI - minI + 1)
var res: [[Character]] = Array(repeating: Array(repeating: "#", count: width), count: height)
for p in pos {
    res[p[0]-minI][p[1]-minJ] = "."
}

for r in res {
    print(String(r))
}
