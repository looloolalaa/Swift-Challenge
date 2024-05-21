// y-y1 == a*(x-x1)
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }


func canSee(_ i: Int, _ j: Int) -> Bool {
    for k in (i+1)..<j {
        let a = Double(arr[j]-arr[i])/Double(j-i)
        let ceil = a*Double(k-i) + Double(arr[i])
        if ceil <= Double(arr[k]) {
            return false
        }
    }
    return true
}

var res = Array(repeating: 0, count: N)
for i in 0..<N-1 {
    for j in (i+1)..<N {
        if canSee(i, j) {
            res[i] += 1
            res[j] += 1
        }
    }
}

print(res.max()!)
