// 범위 약수 개수 => 에라토스테네스 응용
// i*1, i*2, .. 배수 카운트 1씩 증가
import Foundation

func solution(_ e:Int, _ starts:[Int]) -> [Int] {
    var divs: [Int] = Array(repeating: 0, count: e + 1)
    for i in (1...e) {
        var mul = 1
        while i*mul <= e {
            divs[i*mul] += 1
            mul += 1
        }
    }
    
    var pos: [Int] = Array(repeating: -1, count: e + 1)
    pos[e] = e
    for i in stride(from: e-1, to: 0, by: -1) {
        if divs[i] >= divs[pos[i+1]] {
            pos[i] = i
        } else {
            pos[i] = pos[i+1]
        }
    }
    
    // print(divs)
    // print(pos)
    return starts.map { pos[$0] }
}
