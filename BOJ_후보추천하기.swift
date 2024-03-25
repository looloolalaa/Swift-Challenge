// 순서, 카운트 딕셔너리 조합
let N = Int(readLine()!)!
let M = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }


var counter: [Int: Int] = [:]
var time: [Int: Int] = [:]

for (t, a) in arr.enumerated() {
    if counter.count == N && counter[a] == nil {
        let mini = counter.values.min()!
        let students = counter.keys.filter { counter[$0]! == mini }
        let out = (students.count == 1) ? students[0] : students.min { time[$0]! < time[$1]! }!
        counter[out] = nil
        time[out] = nil
    }
    
    counter[a, default: 0] += 1
    if time[a] == nil {
        time[a] = t
    }
}

for s in counter.keys.sorted() {
    print(s, terminator: " ")
}
