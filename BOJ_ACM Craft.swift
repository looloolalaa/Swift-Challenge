// 위상정렬+dp
import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += Int(now)
                now = read()
        }
        
        return str
    }
}

let fIO = FileIO()
let T = fIO.readInt()
for _ in 0..<T {
    let (N, K) = (fIO.readInt(), fIO.readInt())
    var cost = [0]
    for _ in 0..<N {
        cost.append(fIO.readInt())
    }
    
    var tree = Array(repeating: [Int](), count: N+1)
    var cnt = Array(repeating: 0, count: N+1)
    for _ in 0..<K {
        let (X, Y) = (fIO.readInt(), fIO.readInt())
        
        tree[X].append(Y)
        cnt[Y] += 1
    }
    
    let aim = fIO.readInt()
    
    var stack: [Int] = []
    var dp = Array(repeating: -1, count: N+1)
    for node in 1...N {
        if cnt[node] == 0 {
            stack.append(node)
            dp[node] = cost[node]
        }
    }
    
    
    func dfs() {
        let now = stack.removeLast()
        if now == aim { print(dp[now]); return }
        
        for a in tree[now] {
            cnt[a] -= 1
            dp[a] = max(dp[a], dp[now]+cost[a])
            
            if cnt[a] == 0 {
                stack.append(a)
            }
        }
        dfs()
    }
    
    dfs()
}

