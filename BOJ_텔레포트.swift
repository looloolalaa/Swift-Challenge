// 텔레포트 거쳐가기
let NT = readLine()!.split(separator: " ").map { Int($0)! }
let (N, T) = (NT[0], NT[1])
var arr: [[Int]] = []
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func di(_ i: Int, _ j: Int) -> Int {
    let (x1, y1) = (arr[i][1], arr[i][2])
    let (x2, y2) = (arr[j][1], arr[j][2])
    return abs(x1-x2) + abs(y1-y2)
}

let INF = Int(1e9)
func dist(_ A: Int, _ B: Int) -> Int {
    let d = di(A, B)
    
    if arr[A][0] == 1 && arr[B][0] == 1 {
        return min(d, T)
        
    } else if arr[A][0] == 0 && arr[B][0] == 1 {
        var nearDist = INF
        for i in 0..<N where arr[i][0] == 1 && i != A && i != B {
            nearDist = min(nearDist, di(A, i))
        }
        return min(d, nearDist + T)
        
    } else if arr[A][0] == 1 && arr[B][0] == 0 {
        var nearDist = INF
        for i in 0..<N where arr[i][0] == 1 && i != A && i != B {
            nearDist = min(nearDist, di(B, i))
        }
        return min(d, nearDist + T)
        
    } else if arr[A][0] == 0 && arr[B][0] == 0 {
        var (nearDistA, nearDistB) = (INF, INF)
        for i in 0..<N where arr[i][0] == 1 && i != A && i != B {
            nearDistA = min(nearDistA, di(A, i))
            nearDistB = min(nearDistB, di(B, i))
        }
        return min(d, nearDistA + T + nearDistB)
    }
    
    return -1
}

let M = Int(readLine()!)!
for _ in 0..<M {
    let AB = readLine()!.split(separator: " ").map { Int($0)! }
    let (A, B) = (AB[0]-1, AB[1]-1)
    print(dist(A, B))
}
