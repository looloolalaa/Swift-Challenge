// 인덱스 움직이며 찾기
let N = Int(readLine()!)!
let M = Int(readLine()!)!
let str = Array(readLine()!)

var ans = 0
var cnt = 0
var i = 0
while i < M-2 {
    if str[i] == "I" && str[i+1] == "O" && str[i+2] == "I" {
        cnt += 1
        if cnt == N {
            ans += 1
            cnt -= 1
        }
        i += 2
    } else {
        cnt = 0
        i += 1
    }
    
}

print(ans)
