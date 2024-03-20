// k번째 저장되는 수
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (line[0], line[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }

func mergeSort(_ p: Int, _ r: Int) {
    if p < r {
        let q = (p+r) / 2
        mergeSort(p, q)
        mergeSort(q+1, r)
        merge(p, r)
    }
}

var res = -1
var k = 0
var temp = Array(repeating: -1, count: N)
func merge(_ p: Int, _ r: Int) {
    let q = (p+r) / 2
    var (i, j) = (p, q + 1)
    var t = p
    while i <= q && j <= r {
        if arr[i] <= arr[j] {
            temp[t] = arr[i]
            t += 1
            i += 1
        } else {
            temp[t] = arr[j]
            t += 1
            j += 1
        }
    }
    while i <= q {
        temp[t] = arr[i]
        t += 1
        i += 1
    }
    while j <= r {
        temp[t] = arr[j]
        t += 1
        j += 1
    }
    
    for t in p...r {
        arr[t] = temp[t]
        k += 1
        if k == K { res = arr[t] }
    }
}

mergeSort(0, N-1)

print(k < K ? -1 : res)

