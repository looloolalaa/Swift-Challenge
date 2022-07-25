//min, max by key
import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let sorted = sizes.map { $0.sorted() }
    let width = sorted.max { $0[0] < $1[0] }![0]
    let length = sorted.max { $0[1] < $1[1] }![1]
    return width * length
}
