// quack 붙을 수 있나
import Foundation

var res = 0
let front: [Character: Character] = ["u": "q", "a": "u", "c": "a", "k": "c"]
var arr: [String] = []
for c in readLine()! {
    if c == "q" {
        arr.append("q")
        res = max(res, arr.count)
    } else {
        let f = front[c]!
        var found = false
        for i in 0..<arr.count {
            if f == arr[i].last! {
                found = true
                arr[i].append(c)
                if arr[i].count == 5 { arr.remove(at: i) }
                break
            }
        }
        
        if !found { print(-1); exit(0) }
    }
}

if !arr.isEmpty {
    print(-1)
} else {
    print(res)
}


