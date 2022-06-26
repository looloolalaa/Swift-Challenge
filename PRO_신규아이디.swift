// String Handling
import Foundation

func solution(_ new_id:String) -> String {
    var new_id = new_id
    new_id = new_id.lowercased()
    
    new_id = new_id.filter { c in
        return c.isLowercase || c.isNumber || c == "-" || c == "_" || c == "."
    }
    
    while new_id.contains("..") {
        new_id = new_id.replacingOccurrences(of: "..", with: ".")
    }
    
    if new_id.first == "." {
        new_id.removeFirst()
    }
    if new_id.last == "." {
        new_id.removeLast()
    }
    
    if new_id.isEmpty {
        new_id = "a"
    }
    
    if new_id.count >= 16 {
        let endIndex = new_id.index(new_id.startIndex, offsetBy: 15)
        new_id = String(new_id[..<endIndex])
        if new_id.last == "." {
            new_id.removeLast()
        }
    }
    
    if new_id.count <= 2 {
        while new_id.count != 3 {
            new_id.append(new_id.last!)
        }
    }
    return new_id
}
