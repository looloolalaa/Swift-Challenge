// 2차원배열에서 움직일 수 있는 모든 곳 탐색
for _ in 0..<Int(readLine()!)! {
    var tempArr: [[String]] = []
    while true {
        let line = readLine()
        guard let line = line, !line.isEmpty else { break }
        tempArr.append(Array(line).map { String($0) })
    }

    let (N, M) = (tempArr.count, tempArr[0].count)
    var arr = [Array(repeating: "#", count: M+2)]
    for a in tempArr {
        arr.append(["#"]+a+["#"])
    }
    arr.append(Array(repeating: "#", count: M+2))

    func pinCount() -> Int {
        var cnt = 0
        for i in 1...N {
            for j in 1...M {
                if arr[i][j] == "o" {
                    cnt += 1
                }
            }
        }
        return cnt
    }

    var ans = 0
    var mini = Int(1e9)

    func dfs(_ depth: Int, _ pinCnt: Int) {
        for i in 1...N {
            for j in 1...M {
                if arr[i-1][j] == "." && arr[i][j] == "o" && arr[i+1][j] == "o" {
                    arr[i-1][j] = "o"
                    arr[i][j] = "."
                    arr[i+1][j] = "."
                    dfs(depth + 1, pinCnt - 1)
                    arr[i-1][j] = "."
                    arr[i][j] = "o"
                    arr[i+1][j] = "o"
                }
                
                if arr[i-1][j] == "o" && arr[i][j] == "o" && arr[i+1][j] == "." {
                    arr[i-1][j] = "."
                    arr[i][j] = "."
                    arr[i+1][j] = "o"
                    dfs(depth + 1, pinCnt - 1)
                    arr[i-1][j] = "o"
                    arr[i][j] = "o"
                    arr[i+1][j] = "."
                }
                
                if arr[i][j-1] == "." && arr[i][j] == "o" && arr[i][j+1] == "o" {
                    arr[i][j-1] = "o"
                    arr[i][j] = "."
                    arr[i][j+1] = "."
                    dfs(depth + 1, pinCnt - 1)
                    arr[i][j-1] = "."
                    arr[i][j] = "o"
                    arr[i][j+1] = "o"
                }
                
                if arr[i][j-1] == "o" && arr[i][j] == "o" && arr[i][j+1] == "." {
                    arr[i][j-1] = "."
                    arr[i][j] = "."
                    arr[i][j+1] = "o"
                    dfs(depth + 1, pinCnt - 1)
                    arr[i][j-1] = "o"
                    arr[i][j] = "o"
                    arr[i][j+1] = "."
                }
            }
        }
        
        if mini > pinCnt {
            ans = depth
            mini = pinCnt
        }
        return
    }

    dfs(0, pinCount())
    print(mini, ans)
    
}


