func main() {
    let n = 7
    
    var temp = Array(repeating: Array(repeating: -1, count: n), count: n)
    
    func numbering() {
        let dx = [0, 1, 0, -1]
        let dy = [-1, 0, 1, 0]
        
        var (d, dist, num) = (0, 1, 0)
        var (i, j) = (n/2, n/2)
        
        while true {
            for _ in 0..<dist {
                temp[i][j] = num
                num += 1
                (i, j) = (i + dx[d], j + dy[d])
                if num >= n*n { return }
            }
            
            d = (d + 1) % 4
            if d % 2 == 0 {
                dist += 1
            }
        }
    }
    
    numbering()
    for t in temp {
        print(t)
    }
    
}
