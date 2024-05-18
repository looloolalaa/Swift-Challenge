// (0,0) 좌표로 옮기고 회전하고 다시 옮기고
let N = 8
var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 8), count: 8)
for i in 0..<64 {
    arr[i/8][i%8] = i+1
}

var res = Array(repeating: Array(repeating: 0, count: 8), count: 8)
func rotate(_ i: Int, _ j: Int, _ d: Int) {
    for x in i..<i+d {
        for y in j..<j+d {
            res[y-j+i][d-1-(x-i)+j] = arr[x][y]
        }
    }
}

let L = 2
for i in stride(from: 0, to: N, by: 1<<L) {
    for j in stride(from: 0, to: N, by: 1<<L) {
        rotate(i, j, 1<<L)
    }
}
for r in res {
    print(r)
}
