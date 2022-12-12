// string components
import Foundation

func solution(_ s:String) -> String {
    func changed(_ word: String) -> String {
        if word.count <= 1 {
            return word.uppercased()
        } else {
            return word.first!.uppercased() + Array(word)[1...].map { $0.lowercased() }.joined()
        }
    }
    return s.components(separatedBy: " ").map { changed($0) }.joined(separator: " ")
}
