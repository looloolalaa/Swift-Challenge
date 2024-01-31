// 브루트포스 - O(6400_0000)
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, B) = (line[0], line[1], line[2])
var table: [Int] = []
for _ in 0..<N {
    table += readLine()!.split(separator: " ").map { Int($0)! }
}

let have = table.reduce(0, +) + B
func valid(_ height: Int) -> Bool {
    let need = N*M*height
    return need <= have
}

func time(_ height: Int) -> Int {
    var res = 0
    for t in table {
        if t < height {
            res += height - t
        } else if height < t {
            res += 2*(t - height)
        }
    }
    return res
}


var (minTime, result) = (Int(10e10), -1)
for height in 0...256 {
    if valid(height) {
        let t = time(height)
        if minTime >= t {
            minTime = t
            result = height
        }
    }
}

print(minTime, result)


