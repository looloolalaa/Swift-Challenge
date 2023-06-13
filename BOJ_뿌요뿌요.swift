// 4개 이상 연결된 뿌요 찾기 dfs
var table: [[Character]] = []
for _ in 0..<12 {
    table.append(Array(readLine()!))
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 6), count: 12)
var group: [[[Int]]] = []
//group.append([[0, 1], [0, 2]])

let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
func valid(_ i: Int, _ j: Int) -> Bool {
    return 0<=i && i<12 && 0<=j && j<6
}

var gro: [[Int]] = []
func dfs(_ i: Int, _ j: Int) {
    gro.append([i, j])
    visited[i][j] = true

    for d in dxy {
        let (a, b) = (i+d[0], j+d[1])
        if valid(a, b) && table[i][j] == table[a][b] && !visited[a][b] {
            dfs(a, b)
        }
    }

}

func getGroup() -> [[[Int]]] {
    for i in 0..<12 {
        for j in 0..<6 {
            visited[i][j] = false
        }
    }

    var res: [[[Int]]] = []
    for i in 0..<12 {
        for j in 0..<6 {
            if table[i][j] != "." && !visited[i][j] {
                gro = []
                dfs(i, j)
                res.append(gro)
            }
        }
    }

    return res
}

func gravity() {
    for j in 0..<6 {
        var temp: [Character] = []
        for i in 0..<12 {
            if table[i][j] != "." {
                temp.append(table[i][j])
                table[i][j] = "."
            }
        }

        for i in 0..<temp.count {
            table[12-temp.count+i][j] = temp[i]
        }
    }
}


var point = 0
while true {
    group = getGroup()
    let bomb = group.filter { $0.count >= 4 }
    if bomb.isEmpty {
        break
    }

    for b in bomb {
        for xy in b {
            table[xy[0]][xy[1]] = "."
        }
    }
    point += 1

    gravity()

//    for t in table {
//        print(t)
//    }
//    print()
}

print(point)




