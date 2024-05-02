// 대보기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (C, P) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var res = 0
if P == 1 {
    res += C
    for i in 0..<C-4+1 {
        if arr[i]==arr[i+1] && arr[i+1]==arr[i+2] && arr[i+2]==arr[i+3] {
            res += 1
        }
    }
}
if P == 2 {
    for i in 0..<C-2+1 {
        if arr[i]==arr[i+1] {
            res += 1
        }
    }
}
if P == 3 {
    for i in 0..<C-3+1 {
        if arr[i]==arr[i+1] && arr[i+1]==arr[i+2]-1 {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]-1==arr[i+1] {
            res += 1
        }
    }
}
if P == 4 {
    for i in 0..<C-3+1 {
        if arr[i]-1==arr[i+1] && arr[i+1]==arr[i+2] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]+1==arr[i+1] {
            res += 1
        }
    }
}
if P == 5 {
    for i in 0..<C-3+1 {
        if arr[i]==arr[i+1] && arr[i+1]==arr[i+2] {
            res += 1
        }
    }
    for i in 0..<C-3+1 {
        if arr[i]==arr[i+1]+1 && arr[i+1]+1==arr[i+2] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]-1==arr[i+1] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]+1==arr[i+1] {
            res += 1
        }
    }
}
if P == 6 {
    for i in 0..<C-3+1 {
        if arr[i]==arr[i+1] && arr[i+1]==arr[i+2] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]==arr[i+1] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]-2==arr[i+1] {
            res += 1
        }
    }
    for i in 0..<C-3+1 {
        if arr[i]+1==arr[i+1] && arr[i+1]==arr[i+2] {
            res += 1
        }
    }
}
if P == 7 {
    for i in 0..<C-3+1 {
        if arr[i]==arr[i+1] && arr[i+1]==arr[i+2] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]==arr[i+1] {
            res += 1
        }
    }
    for i in 0..<C-2+1 {
        if arr[i]+2==arr[i+1] {
            res += 1
        }
    }
    for i in 0..<C-3+1 {
        if arr[i]==arr[i+1] && arr[i+1]==arr[i+2]+1 {
            res += 1
        }
    }
}

print(res)

