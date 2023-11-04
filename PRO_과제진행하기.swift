// 시간 흐름 구현
import Foundation

func timeToInt(_ s: String) -> Int {
    let splited = s.components(separatedBy: ":")
    return Int(splited[0])! * 60 + Int(splited[1])!
}

func solution(_ plans:[[String]]) -> [String] {
    var timeTable: [Int: String] = [:]
    var table: [String: Int] = [:]
    for plan in plans {
        let start = timeToInt(plan[1])
        timeTable[start] = plan[0]
        table[plan[0]] = Int(plan[2])!
    }
    
    var result: [String] = []
    var remain: [String] = []
    var now = ""
    var time = 0
    while !table.isEmpty {
        if timeTable[time] == nil { // 새로 시작하는 과제가 없을 때
            if now == "" { // 이미 작업중인 과제가 없을때
                time += 1
            } else { // 이미 작업중인 과제가 있을때
                table[now]! -= 1
                if table[now]! == 0 {
                    result.append(now)
                    table[now] = nil
                    now = ""
                    if !remain.isEmpty {
                        now = remain.popLast()!
                    }
                }
                time += 1
            }
        } else { // 새로 시작하는 과제가 있을 때
            let newTask = timeTable[time]! // "korean"
            if now == "" { // 이미 작업중인 과제가 없을때
                now = newTask
                time += 1
            } else { // 이미 작업중인 과제가 있을때
                table[now]! -= 1
                if table[now]! == 0 {
                    result.append(now)
                    table[now] = nil
                    now = newTask
                    time += 1
                } else {
                    remain.append(now)
                    now = newTask
                    time += 1
                }

                
            }
        }
    }
    
    return result
}
