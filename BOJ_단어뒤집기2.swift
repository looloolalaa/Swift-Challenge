// 문자 하나씩 읽기
let S = Array(readLine()! + " ")

var res = ""
var word = ""
var brace = false
for c in S {
    if c == "<" {
        brace = true
        res += word.reversed()
        word = ""
    }
    
    if brace {
        res += String(c)
    } else {
        if c != " " {
            word += String(c)
        } else {
            res += word.reversed() + " "
            word = ""
        }
    }
    
    if c == ">" {
        brace = false
    }
}


print(res)
