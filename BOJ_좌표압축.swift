// sort index
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var book: [Int: Int] = [:]
for (i, v) in Array(Set(arr)).sorted().enumerated() {
    book[v] = i
}

var res = Array(repeating: 0, count: N)
for i in 0..<N {
    res[i] = book[arr[i]]!
}
print(res.map { String($0) }.joined(separator: " "))
