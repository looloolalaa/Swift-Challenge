// 구현
func solution(score: [[Int]]) -> String {
    var score = score
    let n = score.count
    
    var center: [Int] = []
    for i in 0..<n {
        center.append(score[i][i])
    }
    let (maxi, mini) = (center.max()!, center.min()!)
    var (max_c, min_c) = (0, 0)
    for c in center {
        if c == maxi { max_c += 1 }
        if c == mini { min_c += 1 }
    }
    
    if max_c == 1 {
        let i = center.firstIndex(of: maxi)!
        score[i][i] = 0
    }
    if min_c == 1 {
        let i = center.firstIndex(of: mini)!
        score[i][i] = 0
    }
    
    var result: [Character] = []
    for j in 0..<n {
        var total: [Int] = []
        for i in 0..<n {
            if score[i][j] > 0 {
                total.append(score[i][j])
            }
        }
        let avg = Double(total.reduce(0, +)) / Double(total.count)
        if avg >= 90 {
            result.append("A")
        } else if avg >= 80 {
            result.append("B")
        } else if avg >= 70 {
            result.append("C")
        } else if avg >= 50 {
            result.append("D")
        } else {
            result.append("F")
        }
    }
    
    return String(result)
}
