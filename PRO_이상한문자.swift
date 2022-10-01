// several white spaces => components instead split
import Foundation

func solution(_ s:String) -> String {
    func change(_ s: String) -> String {
        return s.enumerated().map { i, c in
            i % 2 == 0 ? c.uppercased() : c.lowercased()
        }.joined()
    }
    
    let words = s.components(separatedBy: " ")
    return words.map { change(String($0)) }.joined(separator: " ")
}
