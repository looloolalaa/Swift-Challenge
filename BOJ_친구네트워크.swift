// 유니온-파인드 응용
import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    var connect: [String: Int] = [:]
    var parent: [String: String] = [:]
    func root(_ x: String) -> String {
        if parent[x] != x {
            parent[x] = root(parent[x]!)
        }
        return parent[x]!
    }

    let F = Int(readLine()!)!
    for _ in 0..<F {
        let line = readLine()!.components(separatedBy: " ")
        let (a, b) = (line[0], line[1])
        if parent[a] == nil {
            parent[a] = a
        }
        if parent[b] == nil {
            parent[b] = b
        }

        let (rootA, rootB) = (root(a), root(b))
        if rootA != rootB {
            parent[rootB] = rootA
            connect[rootA, default: 1] += connect[rootB, default: 1]
            connect[rootB] = 0
        }

        print(connect[rootA]!)
    }

}
