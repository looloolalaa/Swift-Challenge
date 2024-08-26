// 트램펄린 모서리(꼭짓점X)에 배치하기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, L, K) = (line[0], line[1], line[2], line[3])

var stars: [[Int]] = []
for _ in 0..<K {
    stars.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func includeCount(_ x1: Int, _ x2: Int, _ y1: Int, _ y2: Int) -> Int {
    var cnt = 0
    for star in stars {
        let (x, y) = (star[0], star[1])
        if (x1...x2)~=x && (y1...y2)~=y {
            cnt += 1
        }
    }
    return cnt
}

var xRange = Set<[Int]>()
var yRange = Set<[Int]>()

for star in stars {
    let (x, y) = (star[0], star[1])
    xRange.insert([x, x+L])
    yRange.insert([y, y+L])
}

var ans = 0
for xr in xRange {
    for yr in yRange {
        ans = max(ans, includeCount(xr[0], xr[1], yr[0], yr[1]))
    }
}

print(K - ans)
