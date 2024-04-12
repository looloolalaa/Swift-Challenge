// 소수점 오차 +1e-8
import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (line[0], line[1])

var arr: [Double] = []
for _ in 0..<N {
    arr.append(Double(readLine()!)!)
}
arr.sort()

let center = arr[K..<N-K]
let sum = center.reduce(0.0, +)
let x = sum / Double(N-2*K)
let y = (center.first!*Double(K) + sum + center.last!*Double(K)) / Double(N)


print(String(format: "%.2f", x + 1e-8))
print(String(format: "%.2f", y + 1e-8))

