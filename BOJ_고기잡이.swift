// 직사각형에 점 최대 포함
let NlM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, l, M) = (NlM[0], NlM[1], NlM[2])

var arr: [[Int]] = []
for _ in 0..<M {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func maxCount(_ h: Int, _ w: Int) -> Int {
    var xs = Set<Int>()
    var ys = Set<Int>()
    for xy in arr {
        let (x, y) = (xy[0], xy[1])
        xs.insert(x)
        xs.insert(x-h)
        ys.insert(y)
        ys.insert(y-w)
    }
    
    var maxi = 0
    for x in xs {
        for y in ys {
            let (x1, x2, y1, y2) = (x, x+h, y, y+w)
            let got = arr.filter { x1<=$0[0] && $0[0]<=x2 && y1<=$0[1] && $0[1]<=y2 }.count
            
            maxi = max(maxi, got)
        }
    }
    
    return maxi
}


var ans = 0
for h in 1..<l/2 {
    ans = max(ans, maxCount(h, l/2-h))
}
print(ans)
