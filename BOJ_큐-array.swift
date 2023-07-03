// 배열 큐 - front, rear 공간 낭비
import Foundation

var que: [Int] = []
var (head, tail) = (0, 0)

func push(_ x: Int) {
    que.append(x)
    tail += 1
}

func pop() -> Int {
    if empty() { return -1 }
    
    head += 1
    return que[head-1]
}

func size() -> Int {
    return tail - head
}

func empty() -> Bool {
    return head == tail
}

func front() -> Int {
    if empty() { return -1 }
    return que[head]
}

func back() -> Int {
    if empty() { return -1 }
    return que[tail-1]
}

func display() {
    for i in head..<tail {
        print(que[i], terminator: " ")
    }
    print()
}


let N = Int(readLine()!)!

var result: [Int] = []
for _ in 0..<N {
    let inp = readLine()!.components(separatedBy: " ")
    switch inp[0] {
    case "push":
        push(Int(inp[1])!)
    case "pop":
        result.append(pop())
    case "size":
        result.append(size())
    case "empty":
        result.append(empty() ? 1 : 0)
    case "front":
        result.append(front())
    case "back":
        result.append(back())
    default:
        print("?")
    }
}

for r in result {
    print(r)
}
