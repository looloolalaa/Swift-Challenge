// dfs 쌍 가지치기 ["aa", "**"] 
import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    func isMatch(_ u: String, _ b: String) -> Bool {
        if u.count != b.count { return false }
        for (i, j) in zip(u, b) {
            if j != "*" && i != j {
                return false
            }
        }
        return true
    }
    
    var res = Set<Set<String>>()
    func dfs(_ u: [String], _ b: [String], _ s: [[String]]) {
        if u.isEmpty || b.isEmpty { res.insert(Set(s.map { $0[0] })); return }
        var (u, b, s) = (u, b, s)
        for x in u {
            var book = Set<[String]>()
            for y in b {
                if book.contains([x, y]) { continue }
                if isMatch(x, y) {
                    s.append([x, y])
                    let i = u.firstIndex(of: x)!
                    let j = b.firstIndex(of: y)!
                    u.remove(at: i)
                    b.remove(at: j)
                    dfs(u, b, s)
                    book.insert([x, y])
                    
                    s.removeLast()
                    u.insert(x, at: i)
                    b.insert(y, at: j)
                }
            }
        }
    }
    
    dfs(user_id, banned_id, [])
    // print(res)
    return res.count
}
