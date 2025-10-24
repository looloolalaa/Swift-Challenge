var tree = [[0], [3], [3,4], [], []]


var cnt = [0,0,0,0,0]

for a in 1...4 {
    for b in tree[a] {
        cnt[b] += 1
    }
}

var route: [Int] = []
var visited = [false,false,false,false,false]
func dfs() {
    if route.count == 4 { print(route) }
    
    for a in 1...4 {
        if !visited[a] && cnt[a] == 0 {
            visited[a] = true
            route.append(a)
            
            for b in tree[a] {
                cnt[b] -= 1
            }
            dfs()
            for b in tree[a] {
                cnt[b] += 1
            }
            
            visited[a] = false
            route.removeLast()
        }
    }
}


dfs()
