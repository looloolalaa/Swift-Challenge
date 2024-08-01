// 삭제 괄호 위치 선택
let str = Array(readLine()!)

var stack: [Int] = []
var pairs: [(Int, Int)] = []
for i in 0..<str.count {
    if str[i] == "(" {
        stack.append(i)
    } else if str[i] == ")" {
        pairs.append((stack.removeLast(), i))
    }
}

let K = pairs.count
var ans = Set<String>()
func dfs(_ i: Int, _ selected: [Int]) {
    if i == K {
        var res = str
        for (i, j) in selected.map({ pairs[$0] }) {
            res[i] = " "
            res[j] = " "
        }
        ans.insert(String(res.filter { $0 != " " }))
        return
    }
    
    dfs(i+1, selected)
    dfs(i+1, selected + [i])
}

dfs(0, [])
ans.remove(String(str))

for an in ans.sorted() {
    print(an)
}
