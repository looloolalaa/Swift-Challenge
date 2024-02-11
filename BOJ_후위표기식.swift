// stack
let str = Array(readLine()!)
var stack: [Character] = []
for c in str {
    if "A"<=c && c<="Z" { print(c, terminator: "") }
    if c == "(" { stack.append(c) }
    if c == ")" {
        while true {
            let popped = stack.removeLast()
            if popped == "(" { break }
            else { print(popped, terminator: "") }
        }
    }
    if c == "*" || c == "/" {
        while true {
            if stack.isEmpty || stack.last! == "(" || stack.last! == "+" || stack.last! == "-" { break }
            print(stack.removeLast(), terminator: "")
        }
        stack.append(c)
    }
    if c == "+" || c == "-" {
        while true {
            if stack.isEmpty || stack.last! == "(" { break }
            print(stack.removeLast(), terminator: "")
        }
        stack.append(c)
    }
}

while !stack.isEmpty {
    print(stack.removeLast(), terminator: "")
}
