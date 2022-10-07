// x를 root 까지 visited = true
// y도 올리면서 visited[y] == true 인 지점
func lca() {

    let T = Int(readLine()!)!

    var lca: [Int] = []
    for _ in (0..<T) {
      let n = Int(readLine()!)!
      var parents: [Int: Int] = [:]
      var visited: [Bool] = Array(repeating: false, count: n+1)
      
      for _ in (0..<n-1) {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (parent, child) = (line[0], line[1])
        parents[child] = parent
      }
      let line = readLine()!.split(separator: " ").map { Int(String($0))! }
      var (x, y) = (line[0], line[1])


      visited[x] = true
      while parents.keys.contains(x) {
        x = parents[x]!
        visited[x] = true
      }

      while visited[y] != true {
        y = parents[y]!
      }
      lca.append(y)
      
    }

    for l in lca { print(l) }
}

//lca()
