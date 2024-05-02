// 블럭 모양 저장 ..
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (C, P) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let block = [
    [],
    [[0], [0,0,0,0]],
    [[0, 0]],
    [[1,1,0], [0,1]],
    [[0,1,1], [1,0]],
    [[0,0,0], [0,1], [1,0], [0,1,0]],
    [[0,0,0], [0,0], [1,0,0], [0,2]],
    [[0,0,0], [0,0], [0,0,1], [2,0]]
]

var res = 0
let blo = block[P]
for b in blo {
    for i in 0..<(C-b.count+1) {
        var temp: [Int] = []
        for j in 0..<b.count {
            temp.append(arr[i+j] + b[j])
        }
        
        if temp.allSatisfy({$0 == temp[0]}) {
            res += 1
        }
    }
}

print(res)
