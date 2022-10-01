// one line about (odd & even)
func solution(_ s:String) -> String {
    let len = s.count
    return String(Array(s)[(len-1)/2...len/2])
}
