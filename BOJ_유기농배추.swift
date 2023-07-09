// dfs 컬러링 coloring 순서
let T = Int(readLine()!)!
for _ in 0..<T {
    let inp = readLine()!.split(separator: " ").map { Int($0)! }
    let (M, N, K) = (inp[0], inp[1], inp[2])
    var table: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)

    for _ in 0..<K {
        let li = readLine()!.split(separator: " ").map { Int($0)! }
        table[li[1]][li[0]] = 1
    }


    let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    func valid(_ i: Int, _ j: Int) -> Bool {
        return 0<=i && i<N && 0<=j && j<M
    }

    func dfs(_ i: Int, _ j: Int) {
        for d in dxy {
            let (a, b) = (i+d[0], j+d[1])
            if valid(a, b) && table[a][b] == 1 {
                table[a][b] = 2
                dfs(a, b)
            }
        }
    }

    var res = 0
    for i in 0..<N {
        for j in 0..<M {
            if table[i][j] == 1 {
                res += 1
                table[i][j] = 2
                dfs(i, j)
            }
        }
    }

    print(res)
}
