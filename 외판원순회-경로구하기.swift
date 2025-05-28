import Foundation

let INF = Double(1e9)

struct Point {
    let id: Int
    let coordinate: Coordinate
}

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

func straightDistance(p1: Point, p2: Point) -> Double {
    let (c1, c2) = (p1.coordinate, p2.coordinate)
    let (x1, y1) = (c1.latitude, c1.longitude)
    let (x2, y2) = (c2.latitude, c2.longitude)
    return pow(pow((x1-x2),2) + pow((y1-y2),2), 0.5)
}

func makeGraph(points: [Point]) -> [[Double]] {
    let N = points.count
    var graph = Array(repeating: Array(repeating: INF, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            graph[i][j] = straightDistance(p1: points[i], p2: points[j])
        }
    }
    return graph
}

// O(n*n*2^n)
func shortestRoute(myPoint: Point, aimPoints: [Point]) -> [Point] {
    if aimPoints.isEmpty { return [] }
    
    let allPoints = [myPoint] + aimPoints
    let N = allPoints.count
    let graph = makeGraph(points: allPoints)
    
    var dp = Array(repeating: Array(repeating: -1.0, count: N), count: 1 << N)
    var nextNode = Array(repeating: Array(repeating: -1, count: N), count: 1 << N)

    func getDist(_ visited: Int, _ now: Int) -> Double {
        if dp[visited][now] != -1.0 {
            return dp[visited][now]
        }

        if visited == (1 << N) - 1 {
            dp[visited][now] = graph[now][0]

        } else {
            var (minDist, minNode) = (INF, -1)
            for a in (0..<N).reversed() where a != now && graph[now][a] != 0 {
                if (visited & (1 << a)) == 0 {
                    let newDist = graph[now][a] + getDist(visited | (1 << a), a)
                    if minDist > newDist {
                        (minDist, minNode) = (newDist, a)
                    }
                }
            }
            
            dp[visited][now] = minDist
            nextNode[visited][now] = minNode
        }

        return dp[visited][now]
    }
    
    func findRoute() -> [Int] {
        var (visited, now) = (1, 0)
        var route: [Int] = []
        for _ in 0..<N {
            now = nextNode[visited][now]
            if now == -1 { break }
            route.append(now)
            visited |= (1 << now)
        }
        return route
    }

    let minDist = getDist(1, 0)
    var minRoute = findRoute()
    
    let (front, rear) = (minRoute[0], minRoute[minRoute.count-1])
    let (frontDist, rearDist) = (graph[0][front], graph[0][rear])
    if frontDist > rearDist { minRoute.reverse() }
    
    print(minDist - graph[0][2])
    print(minRoute)
    
    print("circle?:", graph[0][3]+graph[3][4]+graph[4][2]+graph[2][5]+graph[5][1])
    return minRoute.map { idx in allPoints[idx] }
}

let me = Point(id: 4444, coordinate: Coordinate(latitude: 37.49787, longitude: 127.11121))
let aim = [
    Point(id: 1, coordinate: Coordinate(latitude: 37.26579, longitude: 127.00009)),
    Point(id: 4, coordinate: Coordinate(latitude: 37.39463, longitude: 127.11121)),
    Point(id: 7, coordinate: Coordinate(latitude: 37.49787, longitude: 127.02764)),
    Point(id: 25, coordinate: Coordinate(latitude: 37.50882, longitude: 126.89119)),
    Point(id: 132, coordinate: Coordinate(latitude: 37.34996, longitude: 127.10896))
]

let _ = shortestRoute(myPoint: me, aimPoints: aim)
