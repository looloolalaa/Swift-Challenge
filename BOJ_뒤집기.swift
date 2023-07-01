// 최소 값
let s = readLine()!

var now: Character = "2"
var (zero, one) = (0, 0)
for c in s {
    if now != c {
        if c == "0" { zero += 1 }
        else if c == "1" { one += 1 }
        
        now = c
    }
}

print(min(zero, one))
