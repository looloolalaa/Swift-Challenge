// dfs 백트래킹
var N = Int(readLine()!)!

var s = Set<Int>()
let book = [1, 5, 10, 50]
var nums = [0, 0, 0, 0]
var z = 0
func dfs(_ i: Int, _ n: Int) {
    if i == 3 {
        z += 1
        nums[i] = n
        s.insert(zip(book, nums).map { $0 * $1 }.reduce(0, +))
        return
    }
    for k in 0...n {
        nums[i] = k
        dfs(i+1, n-k)
    }
}

dfs(0, N)

print(s.count)
