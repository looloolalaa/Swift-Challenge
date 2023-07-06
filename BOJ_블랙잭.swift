// combination 조합 3개 반복문
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (inp[0], inp[1])

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var res = 0
for i in 0..<N {
    for j in (i+1)..<N {
        for k in (j+1)..<N {
            let s = arr[i]+arr[j]+arr[k]
            if s <= M {
                res = max(res, s)
            }
        }
    }
}
print(res)
