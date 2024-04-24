// 벽에 닿으면 반사
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (R, C, M) = (line[0], line[1], line[2])

var fish: [Int: [Int]] = [:]
for _ in 0..<M {
    var li = readLine()!.split(separator: " ").map { Int($0)! }
    if (1...2)~=li[3] { li[2] %= 2*(R-1) }
    else { li[2] %= 2*(C-1) }
    
    fish[li[4]] = Array(li[..<4])
}

let dxy = [[0,0], [-1,0], [1,0], [0,1], [0,-1]]

func nextInfo(_ info: [Int]) -> [Int] {
    var (r, c, s, d) = (info[0], info[1], info[2], info[3])
    (r, c) = (r+dxy[d][0]*s, c+dxy[d][1]*s)
    if (C+1)..<(2*C) ~= c {
        d = 4
        c = 2*C - c
    } else if (2*C)..<(3*C-1) ~= c {
        c = c - 2*(C-1)
    } else if ((-C+2)...0)~=c {
        d = 3
        c = 2-c
    } else if ((-2*C+3)..<(-C+2))~=c {
        c = 2*(C-1) + c
    }
    
    if (R+1)..<(2*R) ~= r {
        d = 1
        r = 2*R - r
    } else if (2*R)..<(3*R-1) ~= r {
        r = r - 2*(R-1)
    } else if ((-R+2)...0)~=r {
        d = 2
        r = 2-r
    } else if ((-2*R+3)..<(-R+2))~=r {
        r = 2*(R-1) + r
    }
    
    return [r,c,s,d]
}

func move() {
    var pool: [[Int]: Int] = [:]
    for (f, info) in fish {
        let nxt = nextInfo(info)
        fish[f] = nxt
        let newPos = [nxt[0], nxt[1]]
        if pool[newPos] == nil {
            pool[newPos] = f
        } else {
            let (mini, maxi) = (min(f, pool[newPos]!), max(f, pool[newPos]!))
            fish[mini] = nil
            pool[newPos] = maxi
        }
    }
    
}


var ans = 0
for j in 0..<C {
    var (minI, weight) = (R+1, 0)
    for (f, info) in fish {
        if info[1] == j+1 && minI > info[0] {
            minI = info[0]
            weight = f
        }
    }
    ans += weight
    fish[weight] = nil
    move()
}

print(ans)
