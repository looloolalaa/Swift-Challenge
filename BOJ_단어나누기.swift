// 문자열 3부분으로 나누기
let str = Array(readLine()!)
let N = str.count
var candi: [String] = []
for i in 1..<N-1 {
    for j in i+1..<N {
        candi.append([str[..<i], str[i..<j], str[j...]].map { String($0.reversed()) }.joined(separator: ""))
    }
}

print(candi.min()!)
