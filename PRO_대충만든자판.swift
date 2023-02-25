// book: Dictionary
import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var book: [Character: Int] = [:]
    for key in keymap {
        let key = Array(key)
        for i in 0..<key.count {
            book[key[i]] = min(book[key[i], default: 100], i+1)
        }
    }
    
    var result: [Int] = []
    for target in targets {
        var s = 0
        for c in target {
            if let d = book[c] {
                s += d
            } else {
                s = -1
                break
            }
        }
        result.append(s)
    }
    return result
}
