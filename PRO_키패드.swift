//dict
import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {

    var (leftLoc, rightLoc) = (10, 11)
    let buttons: [Int: (Int, Int)] = [1:(0, 0), 2: (0, 1), 3: (0, 2),
                                     4: (1, 0), 5: (1, 1), 6: (1, 2),
                                     7: (2, 0), 8: (2, 1), 9: (2, 2),
                                     10: (3, 0), 0: (3, 1), 11: (3, 2)]
    func distance(_ a: Int, _ b: Int) -> Int {
        return abs(buttons[a]!.0 - buttons[b]!.0) + abs(buttons[a]!.1 - buttons[b]!.1)
    }

    var result = ""
    for num in numbers {
        switch num {
        case 1, 4, 7:
            result += "L"
            leftLoc = num
        case 3, 6, 9:
            result += "R"
            rightLoc = num
        default:
            let leftDis = distance(leftLoc, num)
            let rightDis = distance(rightLoc, num)
            if leftDis < rightDis {
                result += "L"
                leftLoc = num
            } else if leftDis > rightDis {
                result += "R"
                rightLoc = num
            } else {
                if hand == "right" {
                    result += "R"
                    rightLoc = num
                } else {
                    result += "L"
                    leftLoc = num
                }

            }
        }
    }
    return result
}
