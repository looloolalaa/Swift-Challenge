// permutations - dfs
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var cards: [String] = []
for _ in (0..<n) {
  cards.append(readLine()!)
}

var temp: [String] = Array(repeating: "-", count: k)
var visited: [Bool] = Array(repeating: false, count: n)

var s: Set<String> = []
func dfs(_ i: Int) {
  if i == k {
    s.insert(temp.joined())
    return
  }
  for j in (0..<n) {
    if !visited[j] {
      temp[i] = cards[j]
      visited[j] = true
      dfs(i+1)
      visited[j] = false
    }
  }
}

dfs(0)
print(s.count)
