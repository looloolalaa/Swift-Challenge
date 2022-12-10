// n radix
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let length = m * t + p
    var book: [Character] = []
    var num = 0
    
    while book.count < length {
        for c in String(num, radix: n).uppercased() {
            book.append(c)
        }
        num += 1
    }
    
    var result = ""
    var i = p - 1
    while result.count < t {
        result += String(book[i])
        i += m
    }
    
    return result
}
