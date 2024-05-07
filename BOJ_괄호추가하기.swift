// 괄호 위치 dfs
let N = Int(readLine()!)!
let str = Array(readLine()!)
var nums: [Int] = []
var ops: [Character] = []
for i in 0..<N {
    if i % 2 == 0 { nums.append(Int(String(str[i]))!) }
    else { ops.append(str[i]) }
}

var ans = -Int(1e9)
var temp: [Int] = []
func dfs(_ i: Int) {
    ans = max(ans, eval(temp))
    if i >= (nums.count-1) {
        return
    }
    
    for j in i..<(nums.count-1) {
        temp.append(j)
        dfs(j+2)
        temp.removeLast()
    }
}

func eval(_ order: [Int]) -> Int {
    var (nums, ops) = (nums, ops)
    for i in order.reversed() {
        var r = nums[i]
        if ops[i] == "+" {
            r += nums[i+1]
        } else if ops[i] == "*" {
            r *= nums[i+1]
        } else if ops[i] == "-" {
            r -= nums[i+1]
        }
        nums[i] = r
        nums.remove(at: i+1)
        ops.remove(at: i)
    }
    
    var res = nums[0]
    for i in 0..<(nums.count-1) {
        if ops[i] == "+" {
            res += nums[i+1]
        } else if ops[i] == "*" {
            res *= nums[i+1]
        } else if ops[i] == "-" {
            res -= nums[i+1]
        }
    }
    return res
}

dfs(0)
print(ans)
