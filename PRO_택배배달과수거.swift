// 두 개의 스택에 cap 만큼 배분
import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var (deliveries, pickups) = (deliveries, pickups)
    
    while !deliveries.isEmpty && deliveries.last! == 0 {
        deliveries.removeLast()
    }
    while !pickups.isEmpty && pickups.last! == 0 {
        pickups.removeLast()
    }
    
    var result = 0
    while !(deliveries.isEmpty && pickups.isEmpty) {
        result += 2 * max(deliveries.count, pickups.count)
        
        var c = cap
        while !deliveries.isEmpty && c >= 0 {
            let popped = deliveries.removeLast()
            if popped <= c {
                c -= popped
            } else {
                deliveries.append(popped - c)
                break
            }
        }
        
        c = cap
        while !pickups.isEmpty && c >= 0 {
            let popped = pickups.removeLast()
            if popped <= c {
                c -= popped
            } else {
                pickups.append(popped - c)
                break
            }
        }
    }
    
    return Int64(result)
}

