// 2차원 배열 4분할
let NMR = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, R) = (NMR[0], NMR[1], NMR[2])

var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func one() -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            res[n-1-i][j] = arr[i][j]
        }
    }
    return res
}

func two() -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            res[i][m-1-j] = arr[i][j]
        }
    }
    return res
}

func three() -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<n {
        for j in 0..<m {
            res[j][n-1-i] = arr[i][j]
        }
    }
    return res
}

func four() -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<n {
        for j in 0..<m {
            res[m-1-j][i] = arr[i][j]
        }
    }
    return res
}

func five() -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            if i < n/2 && j < m/2 {
                res[i][j+m/2] = arr[i][j]
            } else if i < n/2 && j >= m/2 {
                res[i+n/2][j] = arr[i][j]
            } else if i >= n/2 && j >= m/2 {
                res[i][j-m/2] = arr[i][j]
            } else if i >= n/2 && j < m/2 {
                res[i-n/2][j] = arr[i][j]
            }
        }
    }
    return res
}

func six() -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            if i < n/2 && j < m/2 {
                res[i+n/2][j] = arr[i][j]
            } else if i < n/2 && j >= m/2 {
                res[i][j-m/2] = arr[i][j]
            } else if i >= n/2 && j >= m/2 {
                res[i-n/2][j] = arr[i][j]
            } else if i >= n/2 && j < m/2 {
                res[i][j+m/2] = arr[i][j]
            }
        }
    }
    return res
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
for com in line {
    if com == 1 {
        arr = one()
    } else if com == 2 {
        arr = two(  )
    } else if com == 3 {
        arr = three()
    } else if com == 4 {
        arr = four()
    } else if com == 5 {
        arr = five()
    } else if com == 6 {
        arr = six()
    }
}

for a in arr {
    print(a.map { String($0) }.joined(separator: " "))
}
