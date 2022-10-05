// dict.mapValues { $0 + 1 }
import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    func timeToInt(_ s: String) -> Int {
        // "05:34"
        let splited = s.split(separator: ":").map { Int($0)! }
        return splited[0]*60 + splited[1]
    }
    
    var table: [String: Int] = [:]
    var totalTime: [String: Int] = [:]
    
    for r in records {
        let splited = r.split(separator: " ").map { String($0) }
        let (time, car, inOut) = (timeToInt(splited[0]), splited[1], splited[2])
        if inOut == "IN" { table[car] = time }
        if inOut == "OUT" {
            totalTime[car, default: 0] += time - table[car]!
            table.removeValue(forKey: car)
        }
    }
    for car in table.keys {
        totalTime[car, default: 0] += timeToInt("23:59") - table[car]!
    }
    
    let totalPrice: [String: Int] = totalTime.mapValues { t in
        if t <= fees[0] { return fees[1] }
        return fees[1] + Int( ceil(Double(t - fees[0])/Double(fees[2]))*Double(fees[3]) )
    }
    
    return Array(totalPrice).sorted { $0.0 < $1.0 }.map { $0.value }
}
