// 처음과 끝
let N = Int(readLine()!)!
var arr: [String] = []
var s = Set<String>()
for _ in 0..<N {
    let word = readLine()!
    arr.append(word)
    if word != "?" {
        s.insert(word)
    }
}

let i = arr.firstIndex(of: "?")!
let front = (i == 0) ? nil : arr[i-1].last!
let rear = (i == N-1) ? nil : arr[i+1].first!

let M = Int(readLine()!)!
for _ in 0..<M {
    let candi = readLine()!
    if let front = front, candi.first! != front {
        continue
    }
    if let rear = rear, candi.last! != rear {
        continue
    }
    if s.contains(candi) {
        continue
    }
    
    print(candi)
}

