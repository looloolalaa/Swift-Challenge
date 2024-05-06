// 결과에서 역으로 줄이기
let S = Array(readLine()!)
var T = Array(readLine()!)

while S.count != T.count {
    if T.last! == "A" {
        T.removeLast()
    } else {
        T.removeLast()
        T.reverse()
    }
}

print(S == T ? 1 : 0)

