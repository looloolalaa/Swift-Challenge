// 퀴즈
import Foundation

func solution(_ coin:Int, _ cards:[Int]) -> Int {
    var coin = coin
    let n = cards.count
    var idx = n / 3
    var hand = Set<Int>(cards[..<idx])
    var tempCards = Set<Int>()
    
    var ok = false
    var result = 1
    while idx < n {
        ok = false
        
        tempCards.insert(cards[idx])
        tempCards.insert(cards[idx+1])
        idx += 2
        
        for h in hand {
            let pair = (n+1)-h
            if hand.contains(pair) {
                hand.remove(h)
                hand.remove(pair)
                ok = true
                break
            }
        }
        
        if ok {
            result += 1
            continue
        }
         
        if coin >= 1 {
            for h in hand {
                let pair = (n+1)-h
                if tempCards.contains(pair) {
                    hand.remove(h)
                    tempCards.remove(pair)
                    coin -= 1
                    ok = true
                    break
                }
            }
        }
        
        if ok {
            result += 1
            continue
        }
         
        if coin >= 2 {
            for t in tempCards {
                let pair = (n+1)-t
                if tempCards.contains(pair) {
                    tempCards.remove(t)
                    tempCards.remove(pair)
                    coin -= 2
                    ok = true
                    break
                }
            }
        }
        
        if ok {
            result += 1
            continue
        } else {
            break
        }
    }
    
    return result
}

// 1라운드
// 4코인
// [3,6,7,2]
// (1,10)
