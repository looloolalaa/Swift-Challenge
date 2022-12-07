// string handling
import Foundation

func solution(_ record:[String]) -> [String] {
    var name: [String: String] = [:]
    
    var result: [(String, Bool)] = []
    for r in record {
        if r.starts(with: "Leave") {
            let id = String(r.split(separator: " ")[1])
            result.append((id, false))
        } else {
            let temp = r.split(separator: " ").map { String($0) }
            name[temp[1]] = temp[2]
            
            if temp[0] == "Enter" {
                result.append((temp[1], true))
            }
        }
        
        
    }
    
    return result.map { id, enter in
        name[id]! + (enter ? "님이 들어왔습니다." : "님이 나갔습니다.")
    }
}
