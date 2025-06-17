// 그리디: 자릿수 도합
var book: [Character: Int] = [:]
for _ in 0..<Int(readLine()!)! {
    let str = Array(readLine()!)
    
    var digit = 1
    for ch in str.reversed() {
        book[ch, default: 0] += digit
        digit *= 10
    }
    
}

var num = 9
var ans = 0
for mul in book.values.sorted(by: >) {
    ans += num * mul
    num -= 1
}
print(ans)
