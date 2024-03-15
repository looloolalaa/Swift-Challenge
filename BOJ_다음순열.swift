// 순열 응용
import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

if arr == (1...N).reversed() {
    print(-1)
    exit(0)
}

var i = N-1
while arr[i-1] > arr[i] {
    i -= 1
}

let left = arr[i-1]
let newNum = arr[i...].filter { left < $0 }.min()!
let j = arr.firstIndex(of: newNum)!
(arr[i-1], arr[j]) = (arr[j], arr[i-1])
arr[i...].sort()

print(arr.map { String($0) }.joined(separator: " "))
