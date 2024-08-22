// x또는X 인덱스
let N = Int(readLine()!)!
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Array($0) }
    let (S, T) = (line[0], line[1])
    let i = S.firstIndex(of: "x") ?? S.firstIndex(of: "X")!
    
    
    print(T[i].uppercased(), terminator: "")
}
