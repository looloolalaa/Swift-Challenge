// sort by two factors
import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let sortedData = data.sorted { ($0[col-1], -$0[0]) < ($1[col-1], -$1[0]) }
    var result = 0
    for i in row_begin...row_end {
        result ^= sortedData[i-1].reduce(0) { $0 + $1%i }
    }
    return result
}
