// rotate border 
import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var table = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    for i in 0..<rows*columns {
        table[i/columns][i%columns] = i + 1
    }
    
    func rotate(_ q: [Int]) -> Int {
        let (x1, y1, x2, y2) = (q[0]-1, q[1]-1, q[2]-1, q[3]-1)
        var mini = table[x1][y1]
        let first = table[x1][y1]
        
        for i in stride(from: x1, to: x2, by: 1) {
            table[i][y1] = table[i + 1][y1]
            mini = min(mini, table[i][y1])
        }
        
        for j in stride(from: y1, to: y2, by: 1) {
            table[x2][j] = table[x2][j + 1]
            mini = min(mini, table[x2][j])
        }
        
        for i in stride(from: x2, to: x1, by: -1) {
            table[i][y2] = table[i - 1][y2]
            mini = min(mini, table[i][y2])
        }
        
        for j in stride(from: y2, to: y1, by: -1) {
            table[x1][j] = table[x1][j - 1]
            mini = min(mini, table[x1][j])
        }
        table[x1][y1+1] = first
        
        return mini
    }
    
    return queries.map(rotate)
}
