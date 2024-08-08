// 에라토스테네스의 체 응용
let N = Int(readLine()!)!
var arr = Array(repeating: false, count: 1000001)
let nums = readLine()!.split(separator: " ").map { Int($0)! }
for num in nums {
    arr[num] = true
}

var score = Array(repeating: 0, count: 1000001)
for num in nums {
    for j in stride(from: 2*num, to: 1000001, by: num) {
        if arr[j] {
            score[num] += 1
            score[j] -= 1
        }
    }
}

print(nums.map { score[$0] }.map { String($0) }.joined(separator: " "))

