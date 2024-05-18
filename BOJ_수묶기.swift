// -1 0 1 곱
let N = Int(readLine()!)!
var p: [Int] = []
var n: [Int] = []
var res = 0
for _ in 0..<N {
    let k = Int(readLine()!)!
    if k <= 0 { n.append(k) }
    else if 1 < k { p.append(k) }
    else { res += 1 }
}
n.sort()
p.sort()

for i in stride(from: 0, to: n.count-1, by: 2) {
    res += n[i]*n[i+1]
}
if n.count % 2 == 1 { res += n.removeLast() }

for i in stride(from: p.count-1, to: 0, by: -2) {
    res += p[i]*p[i-1]
}
if p.count % 2 == 1 { res += p[0] }


print(res)


