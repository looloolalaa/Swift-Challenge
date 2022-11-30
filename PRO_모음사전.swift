// 사전순서: dfs append
import Foundation

func solution(_ word:String) -> Int {
    var result: [String] = []
    var temp: [String] = []
    func dfs() {
        if temp.count >= 5 { return }
        for c in ["A", "E", "I", "O", "U"] {
            temp.append(c)
            result.append(temp.joined())
            dfs()
            temp.removeLast()
        }
    }
    dfs()
    
    return result.firstIndex(of: word)! + 1
}

// 3905
