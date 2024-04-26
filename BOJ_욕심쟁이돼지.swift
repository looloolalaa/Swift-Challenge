// 양옆, 마주보는 인덱스
let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    var day = 0
    while true {
        if arr.reduce(0, +) > N { break }
        var plus = Array(repeating: 0, count: 6)
        for i in 0..<6 {
            plus[i] += arr[(i-1+6)%6] + arr[(i+1)%6] + arr[(i+3)%6]
        }
        
        for i in 0..<6 {
            arr[i] += plus[i]
        }
        
        day += 1
    }
    print(day + 1)
    
}
