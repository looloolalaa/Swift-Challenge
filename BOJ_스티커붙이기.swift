// 스티커 대보기
let NMK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, K) = (NMK[0], NMK[1], NMK[2])
var table = Array(repeating: Array(repeating: 0, count: M), count: N)

var stickers: [[[Int]]] = []
for _ in 0..<K {
    let RC = readLine()!.split(separator: " ").map { Int($0)! }
    let (R, _) = (RC[0], RC[1])
    
    var sticker: [[Int]] = []
    for _ in 0..<R {
        sticker.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    stickers.append(sticker)
}

func canAttach(_ i: Int, _ j: Int, _ s: [[Int]]) -> Bool {
    let (n, m) = (s.count, s[0].count)
    for a in 0..<n {
        for b in 0..<m {
            if s[a][b] == 1 && table[i+a][j+b] == 1 {
                return false
            }
        }
    }
    return true
}

func att(_ i: Int, _ j: Int, _ s: [[Int]]) {
    let (n, m) = (s.count, s[0].count)
    for a in 0..<n {
        for b in 0..<m {
            table[i+a][j+b] += s[a][b]
        }
    }
}

func attach(_ s: [[Int]]) -> Bool {
    let (n, m) = (s.count, s[0].count)
    if n > N || m > M { return false }
    
    for i in 0..<N-n+1 {
        for j in 0..<M-m+1 {
            if canAttach(i, j, s) {
                att(i, j, s)
                return true
            }
        }
    }
    return false
}

func rotated(_ arr: [[Int]]) -> [[Int]] {
    let (n, m) = (arr.count, arr[0].count)
    var res = Array(repeating: Array(repeating: 0, count: n), count: m)
    for i in 0..<n {
        for j in 0..<m {
            res[j][n-i-1] = arr[i][j]
        }
    }
    return res
}

for sticker in stickers {
    var sti = sticker
    for _ in 0..<4 {
        if attach(sti) { break }
        sti = rotated(sti)
    }
}

var ans = 0
for i in 0..<N {
    for j in 0..<M {
        ans += table[i][j]
    }
}
print(ans)
