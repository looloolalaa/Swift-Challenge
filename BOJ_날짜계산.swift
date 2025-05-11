// a,b,c 1씩 증가
let inp = readLine()!.split(separator: " ").map { Int($0)! }
let (E,S,M) = (inp[0], inp[1], inp[2])

var (e,s,m) = (0,0,0)

var year = 1
while true {
    if (e+1,s+1,m+1) == (E,S,M) {
        print(year)
        break
    }
    
    e = (e+1)%15
    s = (s+1)%28
    m = (m+1)%19
    year += 1
}
