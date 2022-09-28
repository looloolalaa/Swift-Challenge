// zip & append(삼항 연산자)
import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var total: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A":0, "N": 0]
    for (s, c) in zip(survey, choices) {
        if c < 4 {
            total[s.first!]! += 4 - c
        } else if c > 4 {
            total[s.last!]! += c - 4
        }
    }
    
    var answer: String = ""
    answer.append(total["R"]! < total["T"]! ? "T" : "R")
    answer.append(total["C"]! < total["F"]! ? "F" : "C")
    answer.append(total["J"]! < total["M"]! ? "M" : "J")
    answer.append(total["A"]! < total["N"]! ? "N" : "A")
    return answer
}
