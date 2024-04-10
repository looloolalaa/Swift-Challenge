// 구현
var t = 1
while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    var name = [""]
    for _ in 0..<n {
        name.append(readLine()!)
    }
    var cnt = Array(repeating: 0, count: n+1)
    for _ in 0..<(2*n-1) {
        let line = readLine()!.split(separator: " ")
        cnt[Int(line[0])!] += 1
    }
    
    for i in 1...n {
        if cnt[i] == 1 {
            print(t, name[i])
        }
    }
    t += 1
}
