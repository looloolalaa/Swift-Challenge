// 정사각형 회전
import Foundation

func rotated(_ arr: [[String]]) -> [[String]] {
    let (n, m) = (arr.count, arr[0].count)
    var res = Array(repeating: Array(repeating: "0", count: n), count: m)
    for i in 0..<n {
        for j in 0..<m {
            res[j][n-i-1] = arr[i][j]
        }
    }
    return res
}


for _ in 0..<Int(readLine()!)! {
    let str = Array(readLine()!)
    let n = Int(sqrt(Double(str.count)))
    var arr = Array(repeating: Array(repeating: "0", count: n), count: n)
    
    for i in 0..<str.count {
        arr[i/n][i%n] = String(str[i])
    }
    
    for _ in 0..<3 {
        arr = rotated(arr)
    }
    
    for a in arr {
        print(a.joined(separator: ""), terminator: "")
    }
    print()
}
