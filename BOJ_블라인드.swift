// 블라인드 모양 대보기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (M, N) = (line[0], line[1])

var arr: [[Character]] = []
for _ in 0..<(5*M+1) {
    arr.append(Array(readLine()!))
}

let star: [Character] = ["*","*","*","*"]
let empty: [Character] = [".",".",".","."]
var res = [0, 0, 0, 0, 0]
for i in 0..<(5*M+1)-4+1 {
    for j in 0..<(5*N+1)-4+1 {
        let li0 = [(i,j), (i,j+1), (i,j+2), (i,j+3)].map { arr[$0][$1] }
        let li1 = [(i+1,j), (i+1,j+1), (i+1,j+2), (i+1,j+3)].map { arr[$0][$1] }
        let li2 = [(i+2,j), (i+2,j+1), (i+2,j+2), (i+2,j+3)].map { arr[$0][$1] }
        let li3 = [(i+3,j), (i+3,j+1), (i+3,j+2), (i+3,j+3)].map { arr[$0][$1] }
        
        if li0 == empty && li1 == empty && li2 == empty && li3 == empty {
            res[0] += 1
        } else if li0 == star && li1 == empty && li2 == empty && li3 == empty {
            res[1] += 1
        } else if li0 == star && li1 == star && li2 == empty && li3 == empty {
            res[2] += 1
        } else if li0 == star && li1 == star && li2 == star && li3 == empty {
            res[3] += 1
        } else if li0 == star && li1 == star && li2 == star && li3 == star {
            res[4] += 1
        }
    }
}

for r in res {
    print(r, terminator: " ")
}

