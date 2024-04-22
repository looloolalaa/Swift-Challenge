// 윤년
import Foundation

var day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]


let line = readLine()!.components(separatedBy: ", ")
let date = line[0].components(separatedBy: " ")
let (m, d) = (date[0], date[1])
let time = line[1].components(separatedBy: " ")
let (y, t) = (Int(time[0])!, time[1])
let tt = t.components(separatedBy: ":").map { Int($0)! }
let (hour, minute) = (tt[0], tt[1])

if y % 400 == 0 || (y % 4 == 0 && y % 100 != 0) {
    day[1] = 29
}

let dd = day[0..<month.firstIndex(of: m)!].reduce(0, +) + Int(d)!

let total = (dd-1)*24*60 + hour*60 + minute
print((Double(total) / Double(day.reduce(0, +)*24*60)) * 100)
