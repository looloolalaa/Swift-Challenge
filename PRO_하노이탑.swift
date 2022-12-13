// 제일 위 X, 제일 아래 O
// 부분 문제가 같은 형태이기 때문
import Foundation

func solution(_ n:Int) -> [[Int]] {
    var result: [[Int]] = []
    func put(_ start: Int, _ end: Int, _ temp: Int, _ n: Int) {
        if n == 1 {
            result.append([start, end])
            return
        }
        put(start, temp, end, n-1)
        put(start, end, temp, 1)
        put(temp, end, start, n-1)
    }
    put(1, 3, 2, n)
    return result
}



//       2
// 1    3

