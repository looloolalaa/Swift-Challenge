// 2개 스티커 돌려서 붙여보는 경우
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (H, W) = (line[0], line[1])
let N = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func maxiArea(_ a: [Int], _ b: [Int]) -> Int {
    let area = a[0]*a[1] + b[0]*b[1]
    if (a[1] + b[1]) <= W && a[0] <= H && b[0] <= H {
        return area
    }
    if (a[1] + b[0]) <= W && a[0] <= H && b[1] <= H {
        return area
    }
    if (a[0] + b[0]) <= H && a[1] <= W && b[1] <= W {
        return area
    }
    if (a[0] + b[1]) <= H && a[1] <= W && b[0] <= W {
        return area
    }
    
    if (a[0]+b[1]) <= W && a[1] <= H && b[0] <= H {
        return area
    }
    if (a[0]+b[0]) <= W && a[1] <= H && b[1] <= H {
        return area
    }
    if (a[1]+b[0]) <= H && a[0] <= W && b[1] <= W {
        return area
    }
    if (a[1]+b[1]) <= H && a[0] <= W && b[0] <= W {
        return area
    }
    return 0
}

var res = 0
for i in 0..<N {
    for j in (i+1)..<N {
        res = max(res, maxiArea(arr[i], arr[j]))
    }
}

print(res)
