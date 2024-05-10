// arr[i+1] < arr[i+2]
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! } + [0, 0]

var ans = 0
for i in 0..<N {
    if arr[i+1] > arr[i+2] {
        let two = min(arr[i], arr[i+1]-arr[i+2])
        arr[i] -= two; arr[i+1] -= two
        ans += 5*two
        
        let three = min(arr[i], arr[i+1])
        arr[i] -= three; arr[i+1] -= three; arr[i+2] -= three
        ans += 7*three
    } else {
        let three = min(arr[i], arr[i+1], arr[i+2])
        arr[i] -= three; arr[i+1] -= three; arr[i+2] -= three
        ans += 7*three
        
    }
}

print(ans + 3*arr.reduce(0, +))
