// sum(a...b) == (b-a+1)*(a+b)/2
func solution(_ a:Int, _ b:Int) -> Int64 {
    let (a, b) = (min(a, b), max(a, b))
    let n = b-(a-1)
    let s = n*(n+1)/2
    let need = (b-a+1) * (a-1)
    return Int64(s + need)
}


