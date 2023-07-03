// 링크드리스트 큐(노드) - 꽤나 지저분
import Foundation

class Node {
    var data: Int
    var next: Node?

    init(data: Int) {
        self.data = data
    }
}

var head: Node?
var tail: Node?

func push(_ x: Int) {
    let node = Node(data: x)
    if empty() {
        head = node
        tail = node
    } else {
        tail!.next = node
        tail = node
    }

}

func pop() -> Int {
    if empty() { return -1 }

    let x = head!.data
    if size() == 1 {
        (head, tail) = (nil, nil)
    } else {
        head = head!.next
    }
    return x
}

 사이즈도 매번 계산하면 O(1)에 가능
func size() -> Int {
    var s = 0
    var p = head
    while p != nil {
        s += 1
        p = p!.next
    }
    return s
}

func empty() -> Bool {
    return head == nil && tail == nil
}

func front() -> Int {
    if empty() { return -1 }
    return head!.data
}

func back() -> Int {
    if empty() { return -1 }
    return tail!.data
}

func display() {
    var p = head
    while p != nil {
        print(p!.data, terminator: " ")
        p = p!.next
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

