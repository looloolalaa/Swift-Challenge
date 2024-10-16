// 3개 선택 => 투포인터로 2개 선택
import Foundation

let NC = readLine()!.split(separator: " ").map { Int($0)! }
let (N, C) = (NC[0], NC[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

if arr.contains(C) { print(1); exit(0) }

let arrSet = Set(arr)
var (s, e) = (0, N-1)
while s < e {
    let sum = arr[s] + arr[e]
    if sum == C { print(1); exit(0) }
    else if sum >= C {
        e -= 1
    } else if sum < C {
        let diff = C - sum
        if diff != arr[s] && diff != arr[e] && arrSet.contains(diff) {
            print(1); exit(0)
        }
        s += 1
    }
}
print(0)


