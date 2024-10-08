// 길이가 다른 combinations
let N = Int(readLine()!)!
var words: [Int] = []
for _ in 0..<N {
    var word = 0
    for c in readLine()! {
        let diff = UnicodeScalar(String(c))!.value-97
        word |= (1<<diff)
    }
    words.append(word)
}

var ans = 0
func dfs(_ i: Int, _ j: Int, _ selected: Int) {
    if selected == (1<<26)-1 {
        ans += 1
    }
    
    if i == N {
        return
    }
    
    for k in j..<N {
        dfs(i+1, k+1, selected | words[k])
    }
}

dfs(0, 0, 0)
print(ans)
