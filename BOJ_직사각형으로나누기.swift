// 직사각형 3파트로 나누기
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

var board: [[Int]] = [Array(repeating: 0, count: M+1)]
for _ in 0..<N {
    board.append([0] + readLine()!.map { Int(String($0))! })
}

for i in 1...N {
    for j in 1...M {
        board[i][j] += board[i-1][j] + board[i][j-1] - board[i-1][j-1]
    }
}

func area(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int {
    return board[c][d] - board[a-1][d] - board[c][b-1] + board[a-1][b-1]
}


var ans = 0
for i in 1..<N {
    for j in 1..<M {
        let quarter = [area(1,1,i,j), area(1,j+1,i,M), area(i+1,j+1,N,M), area(i+1,1,N,j)]
        
        ans = max(ans, (quarter[0] + quarter[1]) * quarter[2] * quarter[3])
        ans = max(ans, quarter[0] * (quarter[1] + quarter[2]) * quarter[3])
        ans = max(ans ,quarter[0] * quarter[1] * (quarter[2] + quarter[3]))
        ans = max(ans, (quarter[3] + quarter[0]) * quarter[1] * quarter[2])
        
    }
    
}

if M >= 3 {
    for j1 in 1..<(M-1) {
        for j2 in (j1+1)..<M {
            ans = max(ans, area(1, 1, N, j1) * area(1, j1+1, N, j2) * area(1, j2+1, N, M))
        }
    }
}

if N >= 3 {
    for i1 in 1..<(N-1) {
        for i2 in (i1+1)..<N {
            ans = max(ans, area(1, 1, i1, M) * area(i1+1, 1, i2, M) * area(i2+1, 1, N, M))
        }
    }
}

print(ans)
