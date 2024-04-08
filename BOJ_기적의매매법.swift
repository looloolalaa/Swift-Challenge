// 주식 개수 ..
let money = Int(readLine()!)!
var (a, b) = (money, money)

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var (x, y) = (0, 0)

for i in 0..<14 {
    let z = arr[i]
    if a >= z {
        let num = a / z
        a -= num * z
        x += num
    }
}

for i in 3..<14 {
    if arr[i-3] < arr[i-2] && arr[i-2] < arr[i-1] && arr[i-1] < arr[i] {
        b += y * arr[i]
        y = 0
    } else if arr[i-3] > arr[i-2] && arr[i-2] > arr[i-1] && arr[i-1] > arr[i] {
        let num = b / arr[i]
        b -= num * arr[i]
        y += num
    }
}

let p = a + x * arr[13]
let q = b + y * arr[13]
if p > q {
    print("BNP")
} else if p < q {
    print("TIMING")
} else {
    print("SAMESAME")
}
