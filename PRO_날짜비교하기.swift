// 튜플 비교 (리스트 비교는 파이썬만 가능)
import Foundation

func solution(_ date1:[Int], _ date2:[Int]) -> Int {
    let date1 = (date1[0], date1[1], date1[2])
    let date2 = (date2[0], date2[1], date2[2])
    
    return date1 < date2 ? 1 : 0
}
