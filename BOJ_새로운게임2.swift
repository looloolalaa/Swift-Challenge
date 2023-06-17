// 문제 조건 다 구현해도 정답 아닐 수 있으미 -> 특이 케이스가 없나 고민
// 여기선 파랑땜에 뒤 돌았는데 뒤가 빨강인 경우 다시 빨강 룰을 따른다.

// table + pos 좌표 정보 중복 저장
import Foundation

let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, K) = (inp[0], inp[1])

var dir: [Int: Int] = [:]
var pos: [Int: [Int]] = [:]
var table: [[[Int]]] = Array(repeating: Array(repeating: [], count: N), count: N)

var color: [[Int]] = []
for _ in 0..<N {
    color.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

for num in 0..<K {
    let inp = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (i, j, d) = (inp[0]-1, inp[1]-1, inp[2]-1)
    table[i][j].append(num+1)
    pos[num+1] = [i, j]
    dir[num+1] = d
}

let dxy = [[0, 1], [0, -1], [-1, 0], [1, 0]]
func valid(_ p: [Int]) -> Bool {
    return 0<=p[0] && p[0]<N && 0<=p[1] && p[1]<N
}

func move(_ num: Int) -> Bool {
    let d = dir[num]!
    let p = pos[num]!
    
    let np = [p[0]+dxy[d][0], p[1]+dxy[d][1]]
    
    if valid(np) && color[np[0]][np[1]] == 0 {
        let i = table[p[0]][p[1]].firstIndex(of: num)!
        for up in table[p[0]][p[1]][i...] {
            table[np[0]][np[1]].append(up)
            pos[up] = np
        }
        table[p[0]][p[1]] = Array(table[p[0]][p[1]][..<i])
        
        if table[np[0]][np[1]].count >= 4 {
            return true
        }
        
    } else if valid(np) && color[np[0]][np[1]] == 1 {
        let i = table[p[0]][p[1]].firstIndex(of: num)!
        for up in table[p[0]][p[1]][i...].reversed() {
            table[np[0]][np[1]].append(up)
            pos[up] = np
        }
        table[p[0]][p[1]] = Array(table[p[0]][p[1]][..<i])
        
        if table[np[0]][np[1]].count >= 4 {
            return true
        }
        
    } else if (valid(np) && color[np[0]][np[1]] == 2) || !valid(np) {
        dir[num] = (d % 2 == 0) ? (d+1) : (d-1)
        let nd = dir[num]!
        let nnp = [p[0]+dxy[nd][0], p[1]+dxy[nd][1]]
        
        
        if valid(nnp) && color[nnp[0]][nnp[1]] == 0 {
            let i = table[p[0]][p[1]].firstIndex(of: num)!
            for up in table[p[0]][p[1]][i...] {
                table[nnp[0]][nnp[1]].append(up)
                pos[up] = nnp
            }
            table[p[0]][p[1]] = Array(table[p[0]][p[1]][..<i])
            
            if table[nnp[0]][nnp[1]].count >= 4 {
                return true
            }
        } else if valid(nnp) && color[nnp[0]][nnp[1]] == 1 {
            let i = table[p[0]][p[1]].firstIndex(of: num)!
            for up in table[p[0]][p[1]][i...].reversed() {
                table[nnp[0]][nnp[1]].append(up)
                pos[up] = nnp
            }
            table[p[0]][p[1]] = Array(table[p[0]][p[1]][..<i])
            
            if table[nnp[0]][nnp[1]].count >= 4 {
                return true
            }
        }
        
        
    }
    
    
    return false
}

var done = false
for turn in 1...1000 {
    for num in 1...K {
        done = move(num)
        if done {
            print(turn)
            break
        }
    }
    if done { break }
}

//for t in table {
//    print(t)
//}
//print(dir)
//print(pos)

if !done { print(-1) }
