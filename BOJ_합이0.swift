// 개선 - 투포인터
let N = Int(readLine()!)!
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var counter: [Int: Int] = [:]
for a in arr {
    counter[a, default: 0] += 1
}

var ans = 0
for i in 0..<N-1 {
    for j in (i+1)..<N {
        let target = -(arr[i] + arr[j])
        var cnt = counter[target, default: 0]
        if target == arr[i] { cnt -= 1 }
        if target == arr[j] { cnt -= 1 }
        
        ans += cnt
    }
}

print(ans/3)
