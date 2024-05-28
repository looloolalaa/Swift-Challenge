let N = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}
// [5,2,3,4,1]

// 버블
for i in stride(from: N-1, to: -1, by: -1) {
    for j in 0..<i {
        if arr[j] > arr[j+1] {
            (arr[j], arr[j+1]) = (arr[j+1], arr[j])
        }
    }
}

// 선택
for i in 0..<N {
    var (mini, idx) = (arr[i], i)
    for j in i..<N {
        if arr[j] < mini {
            mini = arr[j]
            idx = j
        }
    }
    (arr[i], arr[idx]) = (arr[idx], arr[i])
}

// 삽입
for i in 1..<N {
    let now = arr[i]
    var j = i-1
    while j >= 0 && arr[j] > now {
        arr[j+1] = arr[j]
        j -= 1
    }
    arr[j+1] = now
}

// 머지
var temp = Array(repeating: -1, count: N)
func merge(_ l: Int, _ r: Int) {
    let mid = (l+r)/2
    var (le, ri) = (l, mid+1)
    var t = l
    while le <= mid && ri <= r {
        if arr[le] < arr[ri] {
            temp[t] = arr[le]
            t += 1; le += 1
        } else {
            temp[t] = arr[ri]
            t += 1; ri += 1
        }
    }

    while le <= mid {
        temp[t] = arr[le]
        t += 1; le += 1
    }

    while ri <= r {
        temp[t] = arr[ri]
        t += 1; ri += 1
    }

    for t in l...r {
        arr[t] = temp[t]
    }
}

func mergeSort(_ l: Int, _ r: Int) {
    if l >= r { return }
    let mid = (l+r)/2
    mergeSort(l, mid)
    mergeSort(mid+1, r)
    merge(l, r)
}
mergeSort(0, N-1)

// 퀵
func quickSort(_ l: Int, _ r: Int) {
    if l >= r { return }
    let pivot = arr[l]
    var (le, ri) = (l, r)
    while le < ri {
        while le < ri && arr[ri] > pivot {
            ri -= 1
        }
        while le < ri && arr[le] <= pivot {
            le += 1
        }
        (arr[le], arr[ri]) = (arr[ri], arr[le])
    }
    (arr[l], arr[le]) = (arr[le], arr[l])


    quickSort(l, le-1)
    quickSort(le+1, r)
}
quickSort(0, N-1)

// 힙


for a in arr {
    print(a)
}
