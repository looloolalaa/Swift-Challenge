// binary radix plus
// String(4 | 8, radix: 2)
// Int == 10진수
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map { i in
        let plusBin = String(arr1[i] | arr2[i], radix: 2)
        let zeroBin = String(repeating: "0", count: n - plusBin.count) + plusBin
        return zeroBin.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}



