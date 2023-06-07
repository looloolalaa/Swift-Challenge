// 재귀X -> 반복O
// 큰 수 Double
import Foundation

func solution(_ balls:Int, _ share:Int) -> Int {
    
    func fact(_ n: Int) -> Double {
        if n == 1 { return 1 }
        return (1...n).map { Double($0) }.reduce(1.0, *)
        // return (Double(n) * fact(n-1))
    }
    
    if balls == share { return 1 }
    return Int(round((fact((balls))/(fact((balls)-(share)) * fact((share))))))
    // return Int(round((fact(Double(balls))/(fact(Double(balls)-Double(share)) * fact(Double(share))))))
}
