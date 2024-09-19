// 같은 직선 상에 있는 점 개수 최대
// 고층 건물과 비슷한 문제
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Double($0)! }

var lines = Set<[Double]>()
for i in 0..<N {
    for j in (i+1)..<N {
        let (x1, y1) = (Double(i), arr[i])
        let (x2, y2) = (Double(j), arr[j])
        let d = Double(y2-y1)/Double(x2-x1)
        lines.insert([d, -d*x1+y1])
    }
}

// y-y1 == d(x-x1)
// y == dx-dx1+y1
// y == dx+b

var maxi = 0
for line in lines {
    let (d, b) = (line[0], line[1])
    
    var cnt = 0
    for k in 0..<N {
        let (x3, y3) = (Double(k), arr[k])
        if y3 == d*x3 + b {
            cnt += 1
        }
    }
    maxi = max(maxi, cnt)
}
print(N - maxi)

