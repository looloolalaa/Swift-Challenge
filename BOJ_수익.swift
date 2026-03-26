// 구간합의 최댓값 찾기 - 카다인 알고리즘
while true {
    let N = Int(readLine()!)!
    if N == 0 { break }
    
    var arr: [Int] = []
    for _ in 0..<N {
        arr.append(Int(readLine()!)!)
    }
    
    for i in 1..<N {
        arr[i] = max(arr[i], arr[i-1] + arr[i])
    }
    print(arr.max()!)
}
