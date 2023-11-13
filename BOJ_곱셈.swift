// 21억 큰 수 => logn, 큰 수 런타임 에러
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (A, B, C) = (line[0], line[1], line[2])

func f(_ B: Int) -> Int {
    if B == 1 { return A % C }
    
    let half = f(B/2) % C
    var res = half * half % C
    if B % 2 == 1 {
        res = res * A % C
//        res = (half * half * A) % C
    }
    return res
}


print(f(B))
