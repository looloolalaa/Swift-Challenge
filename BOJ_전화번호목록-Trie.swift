//
//  BOJ_전화번호목록.swift
//  challenge
//
//  Created by Kihyun Lee on 2022/11/17.
//

// Using Trie
import Foundation

class Node {
    var key: Character
    var value: Bool = false
    var children: [Character: Node] = [:]
    
    init(key: Character) {
        self.key = key
    }
}

class Trie {
    var root: Node = Node(key: Character(" "))
    
    func insert(_ s: String) {
        var now = root
        for ch in s {
            if !now.children.keys.contains(ch) {
                now.children[ch] = Node(key: ch)
            }
            now = now.children[ch]!
        }
        now.value = true
    }
    
    func leafCount(_ r: Node) -> Int {
        if r.children.isEmpty { return 1 }
        return r.children.values.reduce(0) { $0 + leafCount($1) }
    }
}

func main() {
    let t = Int(readLine()!)!
    var result: [String] = []
    
    for _ in (0..<t) {
        let n = Int(readLine()!)!
        let tree = Trie()
        for _ in (0..<n) {
            tree.insert(readLine()!)
        }
        
        if tree.leafCount(tree.root) == n {
            result.append("YES")
        } else {
            result.append("NO")
        }
    }
    
    for r in result {
        print(r)
    }
}


