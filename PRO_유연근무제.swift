// 날짜 계산
import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    func toTime(_ a: Int) -> Int {
        let hour = a/100
        let minute = a%100
        return 60*hour + minute
    }
    
    func valid(_ a: Int, _ b: Int) -> Bool {
        let cutLine = toTime(a) + 10
        return toTime(b) <= cutLine
    }
    
    let weekend = (startday == 7) ? (6, 0) : (6-startday, 7-startday)
    let weekday = (0..<7).filter { $0 != weekend.0 && $0 != weekend.1 }

    var ans = 0
    for i in 0..<schedules.count {
        let sche = schedules[i]
        let timelog = timelogs[i]
        
        if weekday.allSatisfy({ valid(sche, timelog[$0]) }) {
            ans += 1
        }
    }
    return ans
}
