// (a ^ b) ^ b == a
var s = 0
var xor = 0
let M = Int(readLine()!)!
for _ in 0..<M {
    let li = readLine()!.split(separator: " ")
    if li[0] == "1" {
        let x = Int(li[1])!
        s += x
        xor ^= x
    } else if li[0] == "2" {
        let x = Int(li[1])!
        s -= x
        xor ^= x
    } else if li[0] == "3" {
        print(s)
    } else if li[0] == "4" {
        print(xor)
    }
}
