// set - set
import Foundation

func solution(_ s:String) -> [Int] {
    let s1 = s.split(separator: "{").map { String($0) }
    let s2 = s1.map { $0.replacingOccurrences(of: "}", with: "") }
    let s3 = s2.map { String($0).split(separator: ",").map { String($0) } }
    
    var sSet = Array(repeating: Set<String>(), count: s3.count + 1)
    for s in s3 {
        sSet[s.count] = Set(s)
    }
    
    var result: [Int] = []
    for i in 1..<sSet.count {
        result.append(Int(sSet[i].subtracting(sSet[i-1]).first!)!)
    }
    return result
}
