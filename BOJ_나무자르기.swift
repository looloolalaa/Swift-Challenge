// 이분 탐색 ...
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
let trees = readLine()!.split(separator: " ").map { Int($0)! }

let maxi = trees.max()!

func value(_ height: Int) -> Int {
    return trees.map { height >= $0 ? 0 : $0 - height }.reduce(0, +)
}


var (left, right) = (0, maxi)
while left <= right {
    let mid = (left + right) / 2
    if M < value(mid) {
        left = mid + 1
    } else if value(mid) < M {
        right = mid - 1
    } else {
        print(mid)
        exit(0)
    }
}

print(right)

