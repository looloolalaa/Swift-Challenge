// 시계수 모든 경우 구하기
func clockNum(_ arr: [Int]) -> Int {
    let (a, b, c, d) = (arr[0], arr[1], arr[2], arr[3])
    return ["\(a)\(b)\(c)\(d)", "\(b)\(c)\(d)\(a)", "\(c)\(d)\(a)\(b)", "\(d)\(a)\(b)\(c)"].map { Int($0)! }.min()!
}

var nums = Set<Int>()
for a in 1...9 {
    for b in 1...9 {
        for c in 1...9 {
            for d in 1...9 {
                nums.insert(clockNum([a, b, c, d]))
            }
        }
    }
}
let order = Array(nums).sorted()

let line = readLine()!.split(separator: " ").map { Int($0)! }
let n = clockNum(line)
print(order.firstIndex(of: n)!+1)
