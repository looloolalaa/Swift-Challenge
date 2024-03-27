// 조건 분기 구현
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])

var arr: [[Int]] = []
for _ in 0..<Int(readLine()!)! {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let X = readLine()!.split(separator: " ").map { Int($0)! }

func dist(_ dir: Int, _ d: Int) -> Int {
    if X[0] == 1 {
        if dir == 1 {
            return abs(X[1] - d)
        } else if dir == 2 {
            return M + min(X[1]+d, N-X[1]+N-d)
        } else if dir == 3 {
            return X[1] + d
        } else if dir == 4 {
            return N-X[1] + d
        }
    }
    
    if X[0] == 2 {
        if dir == 1 {
            return M + min(X[1]+d, N-X[1]+N-d)
        } else if dir == 2 {
            return abs(X[1] - d)
        } else if dir == 3 {
            return X[1] + M-d
        } else if dir == 4 {
            return N-X[1] + M-d
        }
    }
    
    if X[0] == 3 {
        if dir == 1 {
            return X[1] + d
        } else if dir == 2 {
            return M-X[1] + d
        } else if dir == 3 {
            return abs(X[1]-d)
        } else if dir == 4 {
            return N + min(X[1]+d, M-X[1]+M-d)
        }
    }
    
    if X[0] == 4 {
        if dir == 1 {
            return X[1] + N-d
        } else if dir == 2 {
            return M-X[1] + N-d
        } else if dir == 3 {
            return N + min(X[1]+d, M-X[1]+M-d)
        } else if dir == 4 {
            return abs(X[1]-d)
        }
    }
    
    return -1
}

print(arr.map { dist($0[0], $0[1]) }.reduce(0, +))

