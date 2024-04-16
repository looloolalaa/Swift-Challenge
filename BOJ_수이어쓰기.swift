// 원하는 숫자가 처음으로 나오는 다음수
let str = Array(readLine()!)
var N = 1
var i = 0
while true {
    let n = Array(String(N))
    for c in n {
        if c == str[i] {
            i += 1
            if i >= str.count { break }
        }
    }
    
    if i >= str.count { break }
    N += 1
}

print(N)
