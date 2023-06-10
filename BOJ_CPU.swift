// 2진법 변환 zfill
import Foundation

let order = ["ADD", "ADDC", "SUB", "SUBC", "MOV", "MOVC", "AND", "ANDC", "OR", "ORC",
 "NOT", "NOTC",
 "MULT", "MULTC", "LSFTL", "LSFTLC", "LSFTR", "LSFTRC", "ASFTR", "ASFTRC", "RL", "RLC", "RR", "RRC"]

var book: [String: Int] = [:]
for i in 0..<order.count {
    book[order[i]] = i
}

let N = Int(readLine()!)!
var orders: [String] = []
for _ in 0..<N {
    orders.append(readLine()!)
}

func change(_ str: String) -> String {
    let spl = str.components(separatedBy: " ")
    let (com, rd, ra, la) = (spl[0], spl[1], spl[2], spl[3])
    
    var res = ""
    
    let opcode = String(book[com]!, radix: 2)
    res += String(repeating: "0", count: 5-opcode.count) + opcode
    
    res += "0"
    
    let rD = String(Int(rd)!, radix: 2)
    res += String(repeating: "0", count: 3-rD.count) + rD
    
    let rA = String(Int(ra)!, radix: 2)
    res += String(repeating: "0", count: 3-rA.count) + rA
    
    let lastValue = String(Int(la)!, radix: 2)
    if com.last! == "C" {
        res += String(repeating: "0", count: 4-lastValue.count) + lastValue
    } else {
        res += String(repeating: "0", count: 3-lastValue.count) + lastValue + "0"
    }
    
    return res
}

for o in orders {
    print(change(o))
}
