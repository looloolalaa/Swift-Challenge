// suffix, [-n..] slicing 시간초과!! => 인덱싱 비교
let s = readLine()!
let bomb = Array(readLine()!)
let n = bomb.count

var stack: [Character] = []
for c in s {
    stack.append(c)
    if stack.count >= n {
        var allSame = true
        for i in 0..<n {
            if stack[stack.count-n+i] != bomb[i] {
                allSame = false
                break
            }
        }
//    if stack.suffix(n) == bomb { // 시간초과
        
        if allSame {
            for _ in 0..<n {
                stack.removeLast()
            }
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))

