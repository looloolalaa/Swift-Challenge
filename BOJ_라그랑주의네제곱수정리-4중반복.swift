// 중복조합 (using 반복)
import Foundation

var nums: [Int] = []
while true {
    let n = Int(readLine()!)!
    if n == 0 { break }

    nums.append(n)
}

let n = nums.max()!
let root = Int(sqrt(Double(n)))+1

var book = Array(repeating: 0, count: n+1)
for a in 0..<root {
    guard a*a <= n else { break }
    for b in a..<root {
        guard a*a+b*b <= n else { break }
        for c in b..<root {
            guard a*a+b*b+c*c <= n else { break }
            for d in c..<root {
                guard a*a+b*b+c*c+d*d <= n else { break }
                book[a*a+b*b+c*c+d*d] += 1
            }
        }
    }
}

for k in nums {
    print(book[k])
}
