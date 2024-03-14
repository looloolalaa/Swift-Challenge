// zeroCnt
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var res = Array(repeating: 0, count: N)
for i in 0..<N {
    var zero = 0
    for j in 0..<N {
        if zero == arr[i] && res[j] == 0 { res[j] = i+1; break }
        if res[j] == 0 { zero += 1 }
    }
}

print(res.map { String($0) }.joined(separator: " "))
