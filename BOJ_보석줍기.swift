//
//// dp[i] == max(i를 추가 포함하는 누적합, i가 딱 M번째일 때 누적합)
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (N, M) = (line[0], line[1])
//
//var arr: [Int] = [0]
//for _ in 0..<N {
//    arr.append(Int(readLine()!)!)
//}
//
//var s = Array(repeating: 0, count: N+1)
//for i in 1..<N+1 {
//    s[i] = s[i-1] + arr[i]
//}
//
//var dp = s
//
//for i in M..<N+1 {
//    dp[i] = max(dp[i-1]+arr[i], s[i] - s[i-M])
//}
//
////print(s)
////print(dp)
//print(max(0, dp[M...].max()!))
//
