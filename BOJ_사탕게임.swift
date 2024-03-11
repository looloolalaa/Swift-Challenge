// 2차원 배열 인접관계 순회하기
let N = Int(readLine()!)!
var arr: [[Character]] = []
for _ in 0..<N {
    arr.append(Array(readLine()!))
}

func check(_ x: Int, _ y: Int) -> Int {
    var maxCnt = 1
    var cnt = 1
    for j in 0..<N-1 {
        if arr[x][j] == arr[x][j+1] {
            cnt += 1
        } else {
            cnt = 1
        }
        maxCnt = max(maxCnt, cnt)
    }
    
    cnt = 1
    for i in 0..<N-1 {
        if arr[i][y] == arr[i+1][y] {
            cnt += 1
        } else {
            cnt = 1
        }
        maxCnt = max(maxCnt, cnt)
    }
    
    return maxCnt
}

var res = 1
for i in 0..<N {
    for j in 0..<N-1 {
        (arr[i][j], arr[i][j+1]) = (arr[i][j+1], arr[i][j])
        res = max(res, check(i, j))
        res = max(res, check(i, j+1))
        (arr[i][j], arr[i][j+1]) = (arr[i][j+1], arr[i][j])
        
        (arr[j][i], arr[j+1][i]) = (arr[j+1][i], arr[j][i])
        res = max(res, check(j, i))
        res = max(res, check(j+1, i))
        (arr[j][i], arr[j+1][i]) = (arr[j+1][i], arr[j][i])
        
    }
}

print(res)
