// 한 점 기준으로 모든 벡터
// or 피타고라스 or 내적==0
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}

var N = Int(readLine()!)!
var points: [[Int]] = []
for _ in 0..<N {
    points.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var ans = 0
for i in 0..<N {
    var vector: [[Int]: Int] = [:]
    
    for j in 0..<N where i != j {
        let (p1, p2) = (points[i], points[j])
        var (a, b) = (p2[0]-p1[0], p2[1]-p1[1])
        let g = abs(gcd(a, b))
        if g != 0 {
            (a, b) = (a/g, b/g)
        }
        
        vector[[a, b], default: 0] += 1
    }
    
    for (vec, cnt) in vector {
//        [-1,2] => [2,1], [-2,-1]
        let oppo = [vec[1], -vec[0]]
        ans += cnt*vector[oppo, default: 0]
    }
    
}
print(ans)

