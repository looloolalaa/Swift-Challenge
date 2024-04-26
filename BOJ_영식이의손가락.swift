// 나열해보고 규칙성 찾기
let arr = [1,2,3,4,5,4,3,2]

let hurt = Int(readLine()!)!
let N = Int(readLine()!)!

if (2...4)~=hurt {
    print(8*(N / 2) + (N % 2 == 0 ? arr.firstIndex(of: hurt)! : arr.lastIndex(of: hurt)!))
} else {
    print(8*N + arr.firstIndex(of: hurt)!)
}
