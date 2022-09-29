// string traversal
import Foundation

func solution(_ dartResult:String) -> Int {
    var score: [Int] = []
    let dart: String = dartResult.replacingOccurrences(of: "10", with: "t")
    for c in dart {
        if c == "t" { score.append(10) }
        if ("0"..."9").contains(c) { score.append(Int(String(c))!) }
        if c == "D" { score[score.endIndex-1] = pow(score[score.endIndex-1], 2) }
        if c == "T" { score[score.endIndex-1] = pow(score[score.endIndex-1], 3) }
        if c == "#" { score[score.endIndex-1] *= -1 }
        if c == "*" {
            score[score.endIndex-1] *= 2
            if score.count >= 2 { score[score.endIndex-2] *= 2 }
        }
    }
    return score.reduce(0, +)
}


func pow(_ a: Int, _ b: Int) -> Int {
    return Int(pow(Double(a), Double(b)))
}
