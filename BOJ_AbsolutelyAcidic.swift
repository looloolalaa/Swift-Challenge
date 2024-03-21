// 실버 구현 17페이지 문제
let N = Int(readLine()!)!
var counter: [Int: Int] = [:]

for _ in 0..<N {
    counter[Int(readLine()!)!, default: 0] += 1
}

let maxi0 = counter.values.max()!
let a = counter.keys.filter { counter[$0]! == maxi0 }
if a.count >= 2 {
    print(a.max()! - a.min()!)
} else {
    
    let x = a[0]
    counter[x] = nil
    let maxi1 = counter.values.max()!
    let b = counter.keys.filter { counter[$0]! == maxi1 }
    print(max(abs(x - b.min()!), abs(x - b.max()!)))
}
