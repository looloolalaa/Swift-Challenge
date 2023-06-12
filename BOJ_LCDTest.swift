// 테스트하기 좋게 구현
import Foundation

//let temp = [
//    [" ", "-", " "],
//    ["|", " ", "|"],
//    [" ", " ", " "],
//    ["|", " ", "|"],
//    [" ", "-", " "]
//]
//
//for t in temp {
//    print(t.joined())
//}


let inp = readLine()!.components(separatedBy: " ")
var (s, n) = (Int(inp[0])!, inp[1])
//s = 3

var result = Array(repeating: Array(repeating: " ", count: (s+2)*(n.count) + (n.count-1)), count: 2*s+3)


for (step, num) in n.enumerated() {
    let (x, y) = (2*s+3, s+2)
    var res = Array(repeating: Array(repeating: " ", count: y), count: x)
    if num == "1" {
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
    }
    else if num == "0" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][0] = "|"
        }
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
    } else if num == "2" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x/2) {
            res[i][y-1] = "|"
        }
        for i in (x/2+1)..<(x-1) {
            res[i][0] = "|"
        }
    } else if num == "3" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
    } else if num == "4" {
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
        
        for i in 1..<(x/2) {
            res[i][0] = "|"
        }
    } else if num == "5" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x/2) {
            res[i][0] = "|"
        }
        for i in (x/2+1)..<(x-1) {
            res[i][y-1] = "|"
        }
    } else if num == "6" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][0] = "|"
        }
        for i in (x/2+1)..<(x-1) {
            res[i][y-1] = "|"
        }
    } else if num == "7" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
    } else if num == "8" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][0] = "|"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
    } else if num == "9" {
        for j in 1..<(y-1) {
            res[0][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x/2][j] = "-"
        }
        for j in 1..<(y-1) {
            res[x-1][j] = "-"
        }
        
        for i in 1..<(x/2) {
            res[i][0] = "|"
        }
        
        for i in 1..<(x-1) {
            if i == x/2 { continue }
            res[i][y-1] = "|"
        }
    }
    
    
    
    
    for i in 0..<x {
        for j in 0..<y {
            result[i][j+step*(y+1)] = res[i][j]
        }
    }
}


for r in result {
    print(r.joined())
}
