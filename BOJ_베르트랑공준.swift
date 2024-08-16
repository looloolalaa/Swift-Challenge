// n~2n 소수 개수
import Foundation

let N = 123_456 * 2
var isPrime = Array(repeating: 1, count: N+1)
isPrime[0] = 0
isPrime[1] = 0

for i in 2..<Int(sqrt(Double(N)))+1 {
    if isPrime[i] == 0 { continue }
    
    for j in stride(from: i*2, to: N+1, by: i) {
        isPrime[j] = 0
    }
}

for i in 0..<N {
    isPrime[i+1] += isPrime[i]
}



while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    
    print(isPrime[2*n] - isPrime[n])
}
