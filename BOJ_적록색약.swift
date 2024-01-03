// dfs - coloring
let N = Int(readLine()!)!
var table: [[Character]] = []
for _ in 0..<N {
    table.append(Array(readLine()!))
}
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return (0..<N)~=i && (0..<N)~=j
}

func dfs(_ i: Int, _ j: Int) {
    for d in dxy {
        let (a, b) = (i+d[0], j+d[1])
        if valid(a, b) && !visited[a][b] && table[i][j] == table[a][b] {
            visited[a][b] = true
            dfs(a, b)
        }
    }
}

var result = 0

func play() {
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] {
                result += 1
                visited[i][j] = true
                dfs(i, j)
            }
        }
    }
}

play()
print(result, terminator: " ")

result = 0
for i in 0..<N {
    for j in 0..<N {
        visited[i][j] = false
        if table[i][j] == "G" {
            table[i][j] = "R"
        }
    }
}

play()
print(result)
