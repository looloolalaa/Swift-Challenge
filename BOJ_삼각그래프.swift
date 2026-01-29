// 3갈래 길 예외 dp
var k = 1
while true {
    let N = Int(readLine()!)!
    if N == 0 { break }
    
    var arr: [[Int]] = []
    for _ in 0..<N {
        arr.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    arr[0][0] = 1001
    arr[0][2] += arr[0][1]
    
    for i in 1..<N {
        arr[i][0] += min(arr[i-1][0], arr[i-1][1])
        arr[i][1] += min(arr[i-1][0], arr[i-1][1], arr[i-1][2], arr[i][0])
        arr[i][2] += min(arr[i-1][1], arr[i-1][2], arr[i][1])
    }
    
    print("\(k). \(arr[N-1][1])")
    k += 1
}
