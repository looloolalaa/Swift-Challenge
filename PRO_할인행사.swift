// Counter: defaultDict
import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0

    var wantCounter: [String: Int] = [:]
    for (w, n) in zip(want, number) {
        wantCounter[w] = n
    }

    var candisCounter: [String: Int] = [:]
    for d in discount[0..<10] {
        candisCounter[d, default: 0] += 1
    }
    if wantCounter == candisCounter { result += 1 }

    for addIndex in (10..<discount.count) {
        candisCounter[discount[addIndex], default: 0] += 1
        let poped = discount[addIndex-10]
        candisCounter[poped]! -= 1
        if candisCounter[poped]! == 0 { candisCounter[poped] = nil }

        if wantCounter == candisCounter { result += 1 }
    }

    return result
}
