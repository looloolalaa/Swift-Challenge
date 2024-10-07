// 자릿수끼리 더하기
import Foundation

let N = Int(readLine()!)!
//hello
//world

for h in 1...9 {
    for w in 1...9 where !Set([h]).contains(w) {
        let x = (N/10000)%10
        let di = (h+w)%10
        if di == x || di == (x-1+10)%10 {
            for e in 0...9 where !Set([h,w]).contains(e) {
                for o in 0...9 where !Set([h,w,e]).contains(o) {
                    let x = (N/1000)%10
                    let di = (e+o)%10
                    if di == x || di == (x-1+10)%10 {
                        for l in 0...9 where !Set([h,w,e,o]).contains(l) {
                            for r in 0...9 where !Set([h,w,e,o,l]).contains(r) {
                                let x = (N/100)%10
                                let di = (l+r)%10
                                if di == x || di == (x-1+10)%10 {
                                    let x = (N/10)%10
                                    let di = (l+l)%10
                                    if di == x || di == (x-1+10)%10 {
                                        for d in 0...9 where !Set([h,w,e,o,l,r]).contains(d) {
                                            let x = N%10
                                            let di = (o+d)%10
                                            if x == di {
                                                let hello = [h,e,l,l,o].map { String($0) }.joined(separator: "")
                                                let world = [w,o,r,l,d].map { String($0) }.joined(separator: "")
                                                
                                                if Int(hello)! + Int(world)! == N {
                                                    print(String(repeating: " ", count: 7-hello.count) + "\(hello)")
                                                    print("+" + String(repeating: " ", count: 6-world.count) + "\(world)")
                                                    print("-------")
                                                    print(String(repeating: " ", count: 7-String(N).count) + "\(N)")
                                                    exit(0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

print("No Answer")
