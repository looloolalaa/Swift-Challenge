// 2차원 대표색
import Foundation

func solution(_ commands:[String]) -> [String] {
    var value: [[String]] = Array(repeating: Array(repeating: "", count: 51), count: 51)
    var palette: [[(Int, Int)]] = []
    for i in 0...50 {
        var line: [(Int, Int)] = []
        for j in 0...50 {
            line.append((i, j))
        }
        palette.append(line)
    }
    
    var result: [String] = []
    for com in commands {
        let c = com.split(separator: " ").map { String($0) }
        if c[0] == "UPDATE" {
            if c.count == 4 {
                let (r, c, v) = (Int(c[1])!, Int(c[2])!, c[3])
                let color = palette[r][c]
                value[color.0][color.1] = v
                
            } else if c.count == 3 {
                let (v1, v2) = (c[1], c[2])
                for i in 1...50 {
                    for j in 1...50 {
                        if value[i][j] == v1 {
                            value[i][j] = v2
                        }
                    }
                }
            }
            
        } else if c[0] == "MERGE" {
            let (r1, c1, r2, c2) = (Int(c[1])!, Int(c[2])!, Int(c[3])!, Int(c[4])!)
            let (color1, color2) = (palette[r1][c1], palette[r2][c2])
            if color1 == color2 { continue }
            
            if value[color1.0][color1.1] == "" && value[color2.0][color2.1] == "" {
                for i in 1...50 {
                    for j in 1...50 {
                        if palette[i][j] == color2 {
                            palette[i][j] = color1
                        }
                    }
                }
            } else if value[color1.0][color1.1] != "" && value[color2.0][color2.1] == "" {
                for i in 1...50 {
                    for j in 1...50 {
                        if palette[i][j] == color2 {
                            palette[i][j] = color1
                        }
                    }
                }
            } else if value[color1.0][color1.1] == "" && value[color2.0][color2.1] != "" {
                for i in 1...50 {
                    for j in 1...50 {
                        if palette[i][j] == color1 {
                            palette[i][j] = color2
                        }
                    }
                }
            } else {
                value[color2.0][color2.1] = ""
                for i in 1...50 {
                    for j in 1...50 {
                        if palette[i][j] == color2 {
                            palette[i][j] = color1
                        }
                    }
                }
            }
            
        } else if c[0] == "UNMERGE" {
            let (r, c) = (Int(c[1])!, Int(c[2])!)
            let color = palette[r][c]
            let before = value[color.0][color.1]
            value[color.0][color.1] = ""
            value[r][c] = before
            
            
            for i in 1...50 {
                for j in 1...50 {
                    if palette[i][j] == color {
                        palette[i][j] = (i, j)
                    }
                }
            }
            
            
        } else if c[0] == "PRINT" {
            let (r, c) = (Int(c[1])!, Int(c[2])!)
            let color = palette[r][c]
            result.append(value[color.0][color.1] == "" ? "EMPTY" : value[color.0][color.1])
        }
    }
    
    return result
}


// 2500000
