//sorted by: (key1, key2)
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var counter: [Int] = Array(repeating: 0, count: N+2)
    var fail: [Double] = Array(repeating: 0, count: N+2)

    for s in stages {
        counter[s] += 1
    }

    var people = counter.reduce(0, +)
    for (i, c) in counter.enumerated() {
        fail[i] = Double(c) / Double(people)
        people -= c

    }
    return (1...N).sorted { (fail[$0], -$0) > (fail[$1], -$1) }
}
