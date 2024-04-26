// 비가 어떻게 고이는가?
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (H, W) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var ans = 0
var i = 0
while i < W {
    var j = i+1
    while j < W && arr[i] > arr[j] {
        j += 1
    }
    if j == W { break }
    
    let waterHeight = arr[i]
    for k in (i+1)..<j {
        ans += waterHeight - arr[k]
    }
    
    i = j
}

i = W-1
while 0 <= i {
    var j = i-1
    while 0 <= j && arr[j] <= arr[i] {
        j -= 1
    }
    if j == -1 { break }
    
    let waterHeight = arr[i]
    for k in (j+1)..<i {
        ans += waterHeight - arr[k]
    }
    
    i = j
}

print(ans)
