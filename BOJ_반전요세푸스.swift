// 음수 인덱스 나머지
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K, M) = (line[0], line[1], line[2])

var arr = Array(1...N)
var way = true
var res: [Int] = []
var i = 0
while !arr.isEmpty {
    i = i + (way ? (K-1) : -K)
    while !((0..<arr.count)~=i) {
        i = (i+arr.count) % arr.count
    }
    res.append(arr.remove(at: i))

    if res.count % M == 0 {
        way.toggle()
    }
}

for r in res {
    print(r)
}



