// 목표 문자열에서 거꾸로 빼가기
import Foundation

let S = readLine()!
let T = readLine()!

func dfs(_ s: String) {
    if s.count < S.count { return }
    
    if s == S {
        print(1)
        exit(0)
    }
    
    if s.last! == "A" {
        dfs(String(s.dropLast()))
    }
    if s.first! == "B" {
        dfs(String(s.dropFirst().reversed()))
    }
}

dfs(T)
print(0)
