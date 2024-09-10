// dfs - array remove X
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])
var book: [[Int]] = []
for _ in 0..<N {
    book.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var arr = [[], readLine()!.split(separator: " ").map { Int($0)!-1 }, readLine()!.split(separator: " ").map { Int($0)!-1 }]

func waiter(_ player1: Int, _ player2: Int) -> Int {
    var players = Set(0..<3)
    players.remove(player1)
    players.remove(player2)
    return players.popFirst()!
}

var score = [0, 0, 0]
var visited = Array(repeating: false, count: N)
var enemyIndex = [0, 0, 0]
func dfs(_ round: Int, _ player1: Int, _ player2: Int) {
    for i in 0..<3 {
        if score[i] == K {
            if score[0] == K { print(1); exit(0) }
            return
        }
    }
    
    let nextPlayer = waiter(player1, player2)

    if player1 == 0 {
        let (me, enemy) = (player1, player2)
        
        let enemyValue = arr[enemy][enemyIndex[enemy]]
        for myValue in 0..<N where !visited[myValue] {
            if book[myValue][enemyValue] <= 1 {  // enemy win
                score[enemy] += 1
                visited[myValue] = true
                enemyIndex[enemy] += 1
                dfs(round+1, min(enemy, nextPlayer), max(enemy, nextPlayer))
                enemyIndex[enemy] -= 1
                visited[myValue] = false
                score[enemy] -= 1
                
            } else {  // me win
                score[me] += 1
                visited[myValue] = true
                enemyIndex[enemy] += 1
                dfs(round+1, min(me, nextPlayer), max(me, nextPlayer))
                enemyIndex[enemy] -= 1
                visited[myValue] = false
                score[me] -= 1
                
            }
        }
    } else {
        let (p1Value, p2Value) = (arr[player1][enemyIndex[player1]], arr[player2][enemyIndex[player2]])
        if book[p1Value][p2Value] <= 1 {  // p2 win
            score[player2] += 1
            enemyIndex[player1] += 1
            enemyIndex[player2] += 1
            dfs(round+1, min(player2, nextPlayer), max(player2, nextPlayer))
            enemyIndex[player2] -= 1
            enemyIndex[player1] -= 1
            score[player2] -= 1
        } else {  // p1 win
            score[player1] += 1
            enemyIndex[player1] += 1
            enemyIndex[player2] += 1
            dfs(round+1, min(player1, nextPlayer), max(player1, nextPlayer))
            enemyIndex[player2] -= 1
            enemyIndex[player1] -= 1
            score[player1] -= 1
        }
    }
}


dfs(0, 0, 1)
print(0)
