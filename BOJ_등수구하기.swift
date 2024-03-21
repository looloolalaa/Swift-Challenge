// 공동 순위
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, score, P) = (line[0], line[1], line[2])
if N == 0 { print(1); exit(0) }

let arr = readLine()!.split(separator: " ").map { Int($0)! }

let bigger = arr.filter { $0 >= score }.count
let rank = arr.filter { $0 > score }.count + 1

if P <= bigger {
    print(-1)
} else {
    print(rank)
}
