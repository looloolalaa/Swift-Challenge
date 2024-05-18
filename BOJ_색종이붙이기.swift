// dfs return
var arr: [[Int]] = []
for _ in 0..<10 {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func canPut(_ i: Int, _ j: Int, _ d: Int) -> Bool {
    if i+d > 10 || j+d > 10 { return false }
    
    for x in i..<i+d {
        for y in j..<j+d {
            if arr[x][y] == 0 {
                return false
            }
        }
    }
    return true
}

func fill(_ i: Int, _ j: Int, _ d: Int, _ color: Int) {
    for x in i..<i+d {
        for y in j..<j+d {
            arr[x][y] = color
        }
    }
}

func area() -> Int {
    return remain.enumerated().map { $0*$0*(5-$1) }.reduce(0, +)
}

let sum = arr.map { $0.reduce(0, +) }.reduce(0, +)

var remain = [0, 5, 5, 5, 5, 5]
var ans = Int(1e9)
func dfs() {
    let use = 25 - remain.reduce(0, +)
    if use >= ans { return }
    
    if sum == area() {
        ans = use
        return
    }
    
    for i in 0..<10 {
        for j in 0..<10 {
            if arr[i][j] == 1 {
                for paper in (1...5).reversed() {
                    if remain[paper] > 0 && canPut(i, j, paper) {
                        fill(i, j, paper, 0)
                        remain[paper] -= 1
                        dfs()
                        remain[paper] += 1
                        fill(i, j, paper, 1)
                    }
                }
                return
            }
        }
    }
    
}


dfs()

print(ans == Int(1e9) ? -1 : ans)
