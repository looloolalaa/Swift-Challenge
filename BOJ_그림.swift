//// DFS coloring
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m) = (line[0], line[1])
//
//var table: [[Int]] = []
//for _ in 0..<n {
//    table.append(readLine()!.split(separator: " ").map { Int($0)! })
//}
//
//let dxy = [[0, 1], [1, 0], [0, -1], [-1, 0]]
//func valid(_ i: Int, _ j: Int) -> Bool {
//    return (0..<n)~=i && (0..<m)~=j
//}
//
//func dfs(_ i: Int, _ j: Int) -> Int {
//    var s = 1
//    for d in dxy {
//        let (a, b) = (i+d[0], j+d[1])
//        if valid(a, b) && table[a][b] == 1 {
//            table[a][b] = 0
//            s += dfs(a, b)
//        }
//    }
//    return s
//}
//
//var (num, maxi) = (0, 0)
//for i in 0..<n {
//    for j in 0..<m {
//        if table[i][j] == 1 {
//            num += 1
//            table[i][j] = 0
//            maxi = max(maxi, dfs(i, j))
//        }
//    }
//}
//
//print(num)
//print(maxi)
