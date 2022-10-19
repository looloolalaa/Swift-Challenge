// union-find + 경로압축
func repOfSet() {
    var parent: [Int: Int] = [:]
    var result: [String] = []

    func root(_ a: Int) -> Int {
      if !parent.keys.contains(a) {
        parent[a] = a
        return a
      }
      if parent[a] == a { return a }

      // not root
      parent[a] = root(parent[a]!)
      return parent[a]!
    }

    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (line[0], line[1])
    for _ in (0..<m) {
      let line = readLine()!.split(separator: " ").map { Int(String($0))! }
      var (x, a, b) = (line[0], line[1], line[2])
      if x == 0 {
        (a, b) = (min(a, b), max(a, b))

        if root(a) != root(b) {
          parent[root(b)] = root(a)
        }

      }
      else if x == 1 {
        if root(a) == root(b) {
          result.append("YES")
        } else {
          result.append("NO")
        }
      }
    }

    for r in result {
      print(r)
    }

}
