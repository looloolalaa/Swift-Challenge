// 알파벳 비트마스크
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

func idx(_ ch: String) -> Int {
    return Int(UnicodeScalar(ch)!.value - 97)
}

var words: [Int] = []
for _ in 0..<N {
    var word = 0
    for c in readLine()! {
        word |= (1<<idx(String(c)))
    }
    words.append(word)
}

var have = (1<<26)-1
for _ in 0..<M {
    let ox = readLine()!.split(separator: " ")
    let (o, x) = (ox[0], String(ox[1]))
    if o == "1" {
        have &= ~(1<<idx(x))
    } else if o == "2" {
        have |= (1<<idx(x))
    }
    
    var cnt = 0
    for word in words {
        if (have & word) == word {
            cnt += 1
        }
    }
    print(cnt)
}


