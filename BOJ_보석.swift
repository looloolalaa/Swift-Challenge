// 점 포함 개수가 최대인 사각형
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, T, K) = (inp[0], inp[1], inp[2], inp[3])
var points: [[Int]] = []
for _ in 0..<T {
    points.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var xLines = Set<Int>()
var yLines = Set<Int>()
for p in points {
    xLines.insert(p[0] <= N-K ? p[0] : N-K)
    yLines.insert(p[1] >= K ? p[1] : K)
}

var ans = (-1, -1)
var maxi = 0
for x in xLines {
    for y in yLines {
        var includeCnt = 0
        for p in points {
            if (x...x+K)~=p[0] && (y-K...y)~=p[1] {
                includeCnt += 1
            }
        }
        
        if includeCnt >= maxi {
            ans = (x, y)
            maxi = includeCnt
        }
    }
}

print(ans.0, ans.1)
print(maxi)
