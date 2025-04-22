// 경우의 수(가짓수) dfs(1*cnt)
var str: [Int] = []
for ch in readLine()! {
    if ch == "_" {
        str.append(-1)
    } else if "AEIOU".contains(ch) {
        str.append(0)
    } else if ch == "L" {
        str.append(2)
    } else {
        str.append(1)
    }
}

func isContinue(_ arr: [Int]) -> Bool {
    return arr.allSatisfy { $0 == 0 } || arr.allSatisfy { $0 >= 1 }
}

func valid(_ i: Int) -> Bool {
    for j in (i-2)...i {
        let range = [j, j+1, j+2]
        if range.allSatisfy({ 0<=$0 && $0<str.count }) && isContinue(range.map { str[$0] }) {
            return false
        }
    }
    return true
}

let book = [5, 20, 1]
var total = 0
func dfs(_ i: Int, _ cnt: Int) {
    if i == str.count {
        total += cnt
        return
    }
    
    if str[i] != -1 {
        dfs(i+1, cnt)
    } else {
        for ch in canPut {
            str[i] = ch
            if valid(i) {
                dfs(i+1, cnt * book[ch])
            }
            str[i] = -1
        }
    }
}

var canPut = [0,1,2]
dfs(0, 1)
let cnt012 = total

if str.contains(2) {
    print(cnt012)
} else {
    canPut = [0,1]
    total = 0
    dfs(0, 1)
    let cnt01 = total
    print(cnt012 - cnt01)
}

