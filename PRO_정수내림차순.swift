// "340".sort -> ["4", "3", "0"]
// String(["4", "3", "0"]) -> "430"
// like joined
func solution(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}
