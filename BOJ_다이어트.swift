// 2^n 선택 사전 순서 + 튜플 대소 비교
let N = Int(readLine()!)!
let aim = readLine()!.split(separator: " ").map { Int($0)! }

var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func valid(_ sel: [Int]) -> Bool {
    var res = Array(repeating: 0, count: 4)
    for s in sel {
        let line = arr[s]
        for j in 0..<4 {
            res[j] += line[j]
        }
    }
    return zip(res, aim).allSatisfy { $0 >= $1 }
}

var ans_sel: [Int] = []
var ans_money = Int(1e9)
func dfs(_ i: Int, _ selected: [Int]) {
    if i == N {
        if valid(selected) {
            let money = selected.map { arr[$0][4] }.reduce(0, +)
            if ans_money > money {
                ans_money = money
                ans_sel = selected
            } else if ans_money == money && smaller(selected, ans_sel) {
                ans_sel = selected
            }
        }
        return
    }
    
    dfs(i+1, selected)
    dfs(i+1, selected + [i])
}

dfs(0, [])
if ans_money == Int(1e9) {
    print(-1)
} else {
    print(ans_money)
    print(ans_sel.map { String($0+1) }.joined(separator: " "))
}


func smaller(_ a: [Int], _ b: [Int]) -> Bool {
    let mini = min(a.count, b.count)
    for i in 0..<mini {
        if a[i] < b[i] { return true }
        else if a[i] > b[i] { return false }
    }
    return a.count < b.count
}


