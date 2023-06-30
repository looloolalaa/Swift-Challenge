// 추가공간 사용: 랭크 dict 
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var rank: [String: Int] = [:]
    for i in 0..<players.count {
        rank[players[i]] = i
    }
    
    for call in callings {
        let i = rank[call]!
        (rank[players[i]], rank[players[i-1]]) = (i-1, i)
        (players[i], players[i-1]) = (players[i-1], players[i])
        
    }
    
    return players
}

