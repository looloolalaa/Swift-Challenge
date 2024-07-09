// 조건 분기 + 수식
import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

if N == 1 { print("A"); exit(0) }
if N == 2 {
    if arr[0] == arr[1] { print(arr[0]); exit(0) }
    else { print("A"); exit(0) }
}

func isInt(_ n: Double) -> Bool {
    return floor(n) == n
}

var (a, b) = (0.0, 0)
if arr[0] == arr[1] { a = 1; b = 0 }
else {
    a = Double(arr[2]-arr[1])/Double(arr[1]-arr[0])
    b = arr[1]-arr[0]*Int(a)
}

if !isInt(a) { print("B"); exit(0) }
let int_a = Int(a)

for i in 1..<N {
    if arr[i] != arr[i-1]*int_a + b {
        print("B")
        exit(0)
    }
}

print(arr[N-1]*int_a + b)

