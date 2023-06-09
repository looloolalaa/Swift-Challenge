import Foundation

func main() {
    
    let L = Int(readLine()!)!
    let N = Int(readLine()!)!
    var directions: [(Int, String)] = []
    for _ in 0..<N {
        let s = readLine()!.components(separatedBy: " ")
        directions.append((Int(s[0])!, s[1]))
    }
    
    func shape(_ a: [Int]) -> Int {
        if a[1] == a[3] {
            return 0
        } else if a[0] == a[2] {
            return 1
        }
        return 2
    }
    
    func getCross(_ a: [Int], _ b: [Int]) -> [Int] {
        
        // 가로비교
        if shape(a) == 0 && shape(b) == 0 && a[1] == b[1] {
            let axRange = [min(a[0], a[2]), max(a[0], a[2])]
            let bxRange = [min(b[0], b[2]), max(b[0], b[2])]
            
            if a[0] < a[2] {
                if axRange[0]<bxRange[0] && bxRange[0]<=axRange[1] {
                    return [axRange[1], a[1]]
                } else if axRange[0]<bxRange[1] && bxRange[1]<=axRange[1] {
                    return [axRange[0], a[1]]
                }
            } else {
                if axRange[0]<=bxRange[0] && bxRange[0]<axRange[1] {
                    return [axRange[1], a[1]]
                } else if axRange[0]<=bxRange[1] && bxRange[1]<axRange[1] {
                    return [axRange[0], a[1]]
                }
            }
        }
        
        // 세로비교
        else if shape(a) == 1 && shape(b) == 1 && a[0] == b[0] {
            let ayRange = [min(a[1], a[3]), max(a[1], a[3])]
            let byRange = [min(b[1], b[3]), max(b[1], b[3])]
            
            if a[1] < a[3] {
                if ayRange[0]<byRange[0] && byRange[0]<=ayRange[1] {
                    return [a[0], ayRange[1]]
                } else if ayRange[0]<byRange[1] && byRange[1]<=ayRange[1] {
                    return [a[0], ayRange[0]]
                }
            } else {
                if ayRange[0]<=byRange[0] && byRange[0]<ayRange[1] {
                    return [a[0], ayRange[1]]
                } else if ayRange[0]<=byRange[1] && byRange[1]<ayRange[1] {
                    return [a[0], ayRange[0]]
                }
            }
        }
        
        // 교차비교
        else {
            
            let (width, height) = (shape(a) == 0 ? (a, b) : (b, a))
            let xRange = [min(width[0], width[2]), max(width[0], width[2])]
            let yRange = [min(height[1], height[3]), max(height[1], height[3])]
            
            if width[0] < width[2] && height[1] < height[3] {
                if yRange[0]<width[1] && width[1]<=yRange[1] && xRange[0]<height[0] && height[0]<=xRange[1] {
                    return [height[0], width[1]]
                }
            } else if width[0] < width[2] && height[1] > height[3] {
                if yRange[0]<width[1] && width[1]<=yRange[1] && xRange[0]<=height[0] && height[0]<xRange[1] {
                    return [height[0], width[1]]
                }
            } else if width[0] > width[2] && height[1] < height[3] {
                if yRange[0]<=width[1] && width[1]<yRange[1] && xRange[0]<height[0] && height[0]<=xRange[1] {
                    return [height[0], width[1]]
                }
            } else if width[0] > width[2] && height[1] > height[3] {
                if yRange[0]<=width[1] && width[1]<yRange[1] && xRange[0]<=height[0] && height[0]<xRange[1] {
                    return [height[0], width[1]]
                }
            }
        }
        
        
        return [L+1, L+1]
    }
    
    //print(getCross([-4, 4, 4, 4], [2, 0, 2, 4]))
    
    var now = [0, 0]
    var d = 0
    let maxi = L+1
    var snake: [[Int]] = [
        [-maxi, maxi, maxi, maxi],
        [maxi, maxi, maxi, -maxi],
        [maxi, -maxi, -maxi, -maxi],
        [-maxi, -maxi, -maxi, maxi]
    ]
    for (dist, dir) in directions + [(2*L+1, "")] {
        var new_now = now
        if d == 0 {
            new_now[0] += dist
        } else if d == 1 {
            new_now[1] -= dist
        } else if d == 2 {
            new_now[0] -= dist
        } else if d == 3 {
            new_now[1] += dist
        }
        
        var new_line = [now[0], now[1], new_now[0], new_now[1]]
        if new_now == [0, 0] {
            snake.append(new_line)
            break
        }
        
        var cross = [L+1, L+1]
        for body in snake {
            cross = getCross(body, new_line)
            if cross != [L+1, L+1] {
                //            print(body, new_line)
                break
            }
        }
        
        //    print(cross)
        if cross != [L+1, L+1] {
            new_line = [now[0], now[1], cross[0], cross[1]]
            snake.append(new_line)
            break
        }
        
        snake.append(new_line)
        now = new_now
        
        if dir == "R" {
            d = (d+1)%4
        } else if dir == "L" {
            d = (d-1+4)%4
        }
        
    }
    
    var result = 0
    for line in snake[4...] {
        print(line)
        if shape(line) == 0 {
            result += abs(line[0]-line[2])
        } else if shape(line) == 1 {
            result += abs(line[1]-line[3])
        }
    }
    
    print(result)
    
}
