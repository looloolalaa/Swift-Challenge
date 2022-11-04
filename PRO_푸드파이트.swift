import Foundation

func solution(_ food:[Int]) -> String {
    var leffSide = ""
    for i in 1..<food.count {
        let plate = food[i]/2
        leffSide += String(repeating: "\(i)", count: plate)
    }
    return leffSide + "0" + leffSide.reversed()
}
