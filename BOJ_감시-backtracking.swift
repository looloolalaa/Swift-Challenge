// dfs - copy [[Int]]
func main() {

    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])

    var table: [[Int]] = []
    for _ in (0..<n) {
      let line = readLine()!.split(separator: " ").map { Int(String($0))! }
      table.append(line)
    }

    let direc = [1: [[1],[2],[3],[4]], 2: [[1,3], [2, 4]], 3: [[1, 2], [2, 3], [3, 4], [4, 1]], 4: [[1,2,3], [1,2,4], [1,3,4], [2,3,4]], 5: [[1,2,3,4]]]
    let arrow = [1: (0, 1), 2: (1, 0), 3: (0, -1), 4: (-1, 0)]

    func plus(_ a: (Int, Int), _ b: (Int, Int)) -> (Int, Int) {
        return (a.0 + b.0, a.1 + b.1)
    }

    func valid(_ a: Int, _ b: Int) -> Bool {
      return (0 <= a && a < n) && (0 <= b && b < m)
    }

    func see(_ table: [[Int]], _ p: Int, _ dir: [Int]) -> [[Int]] {
      var table = table
      let (i, j) = (p/m, p%m)
      for d in dir {
        var (k, l) = plus((i, j), arrow[d]!)
        while valid(k, l) && table[k][l] != 6 {
          if table[k][l] == 0 { table[k][l] = -1 }
          (k, l) = plus((k, l), arrow[d]!)
        }
      }
      return table
    }

    func zero_count(_ table: [[Int]]) -> Int {
      var counter = 0
      for i in (0..<n) {
        for j in (0..<m) {
          if table[i][j] == 0 { counter += 1}
        }
      }
      return counter
    }

    var candis: [Int] = []

    func dfs(_ table: [[Int]], _ number: Int) {
      if number == n*m {
        candis.append(zero_count(table))
        return
      }
      let (i, j) = (number/m, number%m)
      let now = table[i][j]
      if 1 <= now && now <= 5 {
        for d in direc[now]! {
          let new_table = see(table, number, d)
          dfs(new_table, number + 1)
        }
      } else {
        dfs(table, number + 1)
      }
      
    }

    dfs(table, 0)
    print(candis.min()!)
    
}

//main()
