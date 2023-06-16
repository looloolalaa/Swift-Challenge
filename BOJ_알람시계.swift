// 시간계산
import Foundation

let inp = readLine()!.components(separatedBy: " ")
let (h, m) = (Int(inp[0])!, Int(inp[1])!)

let s = 60*h + m
let res = (s - 45 + 60*24) % (60*24)

print(res / 60, res % 60)
