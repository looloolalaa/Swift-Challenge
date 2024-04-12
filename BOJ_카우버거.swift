// 최대 할인
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (line[0], line[1], line[2])
var A = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }
var B = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }
var C = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }

print(A.reduce(0, +) + B.reduce(0, +) + C.reduce(0, +))
for i in 0..<min(a, b, c) {
    A[i] = Int(Double(A[i])*0.9)
    B[i] = Int(Double(B[i])*0.9)
    C[i] = Int(Double(C[i])*0.9)
}

print(A.reduce(0, +) + B.reduce(0, +) + C.reduce(0, +))
