// date to Int & string handling
import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    func dateToInt(_ date: String) -> Int {
        let spl = date.split(separator: ".").map { Int(String($0))! }
        return spl[0]*12*28 + spl[1]*28 + spl[2]
    }
    
    var book: [String: Int] = [:]
    for t in terms {
        let spl = t.split(separator: " ").map { String($0) }
        book[spl[0]] = Int(spl[1])! * 28
    }
    
    var result: [Int] = []
    for i in 0..<privacies.count {
        let spl = privacies[i].split(separator: " ").map { String($0) }
        let dueDate = dateToInt(spl[0]) + book[spl[1]]!
        if dueDate <= dateToInt(today) {
            result.append(i + 1)
        }
    }
    return result
}
