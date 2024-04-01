// 이기고 있던 총 시간
import Foundation

func timeToInt(_ s: String) -> Int {
    let inp = s.split(separator: ":").map { Int($0)! }
    return 60*inp[0]+inp[1]
}

func intToTime(_ sec: Int) -> String {
    let front = sec/60 < 10 ? "0\(sec/60)" : "\(sec/60)"
    let rear = sec%60 < 10 ? "0\(sec%60)" : "\(sec%60)"
    return front+":"+rear
}

let N = Int(readLine()!)!
var arr: [(Int, Int)] = [(-1, 0)]
for _ in 0..<N {
    let line = readLine()!.components(separatedBy: " ")
    arr.append((Int(line[0])!, timeToInt(line[1])))
}
arr.append((-1, 48*60))
arr.sort { $0.1 < $1.1 }

var score = [1: 0, 2: 0, -1: 0]
var res = [1: 0, 2: 0]
for i in 1..<arr.count {
    let (team, time) = (arr[i].0, arr[i].1)
    if score[1]! < score[2]! {
        res[2]! += time - arr[i-1].1
    } else if score[1]! > score[2]! {
        res[1]! += time - arr[i-1].1
    }
    
    score[team]! += 1
}

print(intToTime(res[1]!))
print(intToTime(res[2]!))

