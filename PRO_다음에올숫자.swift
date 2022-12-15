// careful: division by 0
import Foundation

func solution(_ common:[Int]) -> Int {
    let (d, r) = (common[1] - common[0], common[0] != 0 ? common[1] / common[0] : 0)
    return common[1] + d == common[2] ? common.last! + d : common.last! * r
}
