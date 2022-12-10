// edge case 24:00
func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    func time(_ s: String, _ e: String) -> Int {
        let s = s.split(separator: ":").map { Int(String($0))! }
        let (sh, sm) = (s[0], s[1])
        let e = e.split(separator: ":").map { Int(String($0))! }
        let (eh, em) = (e[0], e[1])
        
        let total = eh*60 + em - (sh*60 + sm)
        return total >= 0 ? total : 24*60 - (sh*60 + sm)
    }
    
    func getMelody(_ m: String) -> String {
        var m = m.replacingOccurrences(of: "C#", with: "c")
        m = m.replacingOccurrences(of: "D#", with: "d")
        m = m.replacingOccurrences(of: "F#", with: "f")
        m = m.replacingOccurrences(of: "G#", with: "g")
        m = m.replacingOccurrences(of: "A#", with: "a")
        return m
    }
    
    
    // "HELLO": "CDEFGABCDEFGAB"
    // "WOLRD": "ABCDE"
    var book: [String: String] = [:]
    for music in musicinfos {
        let spl = music.split(separator: ",").map { String($0) }
        let (s, e, title, melody) = (spl[0], spl[1], spl[2], spl[3])
        let melodyArr = Array(getMelody(melody)).map { String($0) }
        
        let len = time(s, e)
        var temp: [String] = Array(repeating: "", count: len)
        for i in (0..<len) {
            temp[i] = melodyArr[i % melodyArr.count]
        }
        
        book[title] = temp.joined()
    }
    
    var answer = "(None)"
    var answerLen = 0
    let m = getMelody(m)
    for (key, value) in book {
        if value.contains(m) && answerLen < value.count {
            answer = key
            answerLen = value.count
        }
    }
    
    return answer
}
