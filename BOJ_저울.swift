// 그리디: 만들수있는 숫자 범위
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var maxi = 0
for a in arr {
    if a <= maxi + 1 {
        maxi += a
    } else {
        break
    }
}

print(maxi+1)
