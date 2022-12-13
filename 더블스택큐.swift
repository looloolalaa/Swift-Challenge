class MyQueue<T> {
    var dequeStack: [T] = []
    var enqueStack: [T] = []
    
    func push(_ x: T) {
        enqueStack.append(x)
    }
    
    func pop() -> T {
        if dequeStack.isEmpty {
            dequeStack = enqueStack.reversed() // O(1)
            enqueStack = []
        }
        return dequeStack.removeLast()
    }
    
    func size() -> Int { dequeStack.count + enqueStack.count }
    func empty() -> Bool { dequeStack.isEmpty && enqueStack.isEmpty }
    func front() -> T { !dequeStack.isEmpty ? dequeStack.last! : enqueStack.first! }
    func back() -> T { !enqueStack.isEmpty ? enqueStack.last! : dequeStack.first! }
}



