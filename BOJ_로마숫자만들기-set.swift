// set dp
let N = Int(readLine()!)!

var s = Set<Int>([0])
for _ in 0..<N {
    var nxt = Set<Int>()
    for k in s {
        nxt.insert(k+1)
        nxt.insert(k+5)
        nxt.insert(k+10)
        nxt.insert(k+50)
    }
    s = nxt
}

print(s.count)
