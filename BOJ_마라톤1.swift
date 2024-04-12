// 지점을 뺐을 때 가장 큰 차이
import Foundation

let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func dist(_ a: [Int], _ b: [Int]) -> Int {
    return abs(a[0]-b[0]) + abs(a[1]-b[1])
}

var total = 0
for i in 0..<N-1 {
    total += dist(arr[i], arr[i+1])
}

var maxDiff = 0
for i in 1..<N-1 {
    let original = dist(arr[i-1], arr[i]) + dist(arr[i], arr[i+1])
    let newDist = dist(arr[i-1], arr[i+1])
    
    maxDiff = max(maxDiff, original - newDist)
}

print(total - maxDiff)
