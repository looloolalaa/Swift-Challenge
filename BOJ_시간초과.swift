// 큰 수 가지치기
import Foundation

func fact(_ n: Int) -> Int {
    if n == 1 { return 1 }
    return n * fact(n-1)
}

let C = Int(readLine()!)!
for _ in 0..<C {
    let line = readLine()!.components(separatedBy: " ")
    let (O, N, T, L) = (line[0], Int(line[1])!, Int(line[2])!, Int(line[3])!)
    let limit = L * (1_0000_0000)
    var time = -1
    if O == "O(N)" {
        time = N * T
    } else if O == "O(N^2)" {
        if N >= 100000 {
            print("TLE!")
            continue
        }
        time = N*N*T
    } else if O == "O(N^3)" {
        if N > 1000 {
            print("TLE!")
            continue
        }
        time = N*N*N*T
    } else if O == "O(2^N)" {
        if N >= 30 {
            print("TLE!")
            continue
        }
        time = Int(pow(2, Double(N))) * T
    } else if O == "O(N!)" {
        if N >= 13 {
            print("TLE!")
            continue
        }
        time = fact(N) * T
    }
    
    print(time <= limit ? "May Pass." : "TLE!")
}
