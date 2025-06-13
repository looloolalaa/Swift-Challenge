// 그리디: 물이 새는 위치 앞쪽에 배치
let NL = readLine()!.split(separator: " ").map { Int($0)! }
let (N, L) = (NL[0], NL[1])

let waters = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var cover = -1
var ans = 0
for water in waters {
    if cover <= water {
        ans += 1
        cover = water + L
    }
}
print(ans)
