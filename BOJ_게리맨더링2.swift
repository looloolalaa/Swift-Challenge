// x,y 좌표 그래프로 생각
let N = Int(readLine()!)!
var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
var people: [[Int]] = []
for _ in 0..<N {
    people.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func valid(_ p: (Int, Int)) -> Bool {
    return (0..<N)~=p.0 && (0..<N)~=p.1
}

func visit(_ x: Int, _ y: Int, _ d1: Int, _ d2: Int) {
    for i in 0..<N {
        for j in 0..<N {
            if i+y-x >= j, j >= i+y-d1-(x + d1) && -i + y + x <= j, j <= -i + y + d2 + (x + d2) {
                arr[i][j] = 5
            } else if (0..<x+d1)~=i && (0...y)~=j {
                arr[i][j] = 1
            } else if (0...x+d2)~=i && (y+1)..<(N+1)~=j {
                arr[i][j] = 2
            } else if (x+d1)..<(N+1)~=i && (0..<y-d1+d2)~=j {
                arr[i][j] = 3
            } else if (x+d2+1)..<(N+1)~=i && (y-d1+d2)..<(N+1)~=j {
                arr[i][j] = 4
            }
        }
    }
    
}

func nums() -> [Int] {
    var res = [0,0,0,0,0,0]
    for i in 0..<N {
        for j in 0..<N {
            res[arr[i][j]] += people[i][j]
        }
    }
    return res
}

var ans = Int(1e9)
for i in 0..<N {
    for j in 0..<N {
        for d1 in 1..<N {
            for d2 in 1..<N {
                if [(i,j), (i+d1,j-d1), (i+d2,j+d2), (i+d1+d2,j-d1+d2)].allSatisfy({ valid($0) }) {
                    
                    arr = Array(repeating: Array(repeating: 0, count: N), count: N)
                    visit(i, j, d1, d2)
                    let res = nums()[1...]
                    ans = min(ans, res.max()! - res.min()!)
                }
            }
        }
    }
}

print(ans)
