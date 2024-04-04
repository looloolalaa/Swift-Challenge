// 문자열 조건 확인 - [1...], components ""
import Foundation

func isC(_ str: String) -> Bool {
    let words = str.components(separatedBy: "_")
    if words.contains("") {
        return false
    }
    for word in words {
        if !word.allSatisfy({ $0.isLowercase }) {
            return false
        }
    }
    return true
}

func isJava(_ str: String) -> Bool {
    let str = Array(str)
    if str.count <= 1 { return str[0].isLowercase }
    return str[0].isLowercase && str[1...].allSatisfy { $0.isLowercase || $0.isUppercase }
}

func cToJava(_ str: String) -> String {
    let res = str.components(separatedBy: "_").map { $0.first!.uppercased() + (($0.count > 1) ? String(Array($0)[1...]) : "") }.joined(separator: "")
    if res.count <= 1 { return res.lowercased() }
    return res.first!.lowercased() + Array(res)[1...]
}

func javaToC(_ str: String) -> String {
    let str = Array(str)
    var divider: [Int] = [0]
    for i in 0..<str.count {
        if str[i].isUppercase {
            divider.append(i)
        }
    }
    divider.append(str.count)
    
    var res: [String] = []
    for i in 1..<divider.count {
        res.append(String(str[divider[i-1]..<divider[i]]).lowercased())
    }
    
    return res.joined(separator: "_")
}

let str = readLine()!
if str == "" {
    print("")
} else if isC(str) {
    print(cToJava(str))
} else if isJava(str) {
    print(javaToC(str))
} else {
    print("Error!")
}

