/*
 map
 */
import Foundation

func solution(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
    var reported: [String: [String]] = [:]
    var report_count: [String: Int] = [:]
    
    for str in Set(report) {
        let splited = str.split(separator: " ").map { String($0) }
        let (a, b) = (splited[0], splited[1])
        reported[a, default: []].append(b)
        report_count[b, default: 0] += 1
    }
    
    return id_list.map { i in
        let candi = reported[i, default: []]
        let criminal = candi.filter { report_count[$0, default: 0] >= k }
        return criminal.count
    }
    
}
