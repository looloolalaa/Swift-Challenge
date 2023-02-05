// "A" + 2
import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var book: [String] = []
    for i in 0..<26 {
        book.append(String(UnicodeScalar(Int(UnicodeScalar("a").value) + i)!))
    }

    for sk in skip {
        if let i = book.firstIndex(of: String(sk)) {
            book.remove(at: i)
        }
    }
    
    var result = ""
    for c in s {
        let i = book.firstIndex(of: String(c))!
        result += book[(i+index) % book.count]
    }
    return result
}
