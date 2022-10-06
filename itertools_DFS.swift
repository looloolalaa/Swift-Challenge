// if item == (Int, Int)
// it could be dirty
import Foundation

let (n, m) = (4, 3)
let cards: [Int] = [1,2,3,4]

var temp: [Int] = Array(repeating: 0, count: m)
var result: [[Int]] = []


func dfs_combinations(_ i: Int, _ start: Int) {
    if i == m {
        result.append(temp)
        return
    }
    for j in (start..<n) {
        temp[i] = cards[j]
        dfs_combinations(i+1, j+1)
    }
}

var visited: [Bool] = Array(repeating: false, count: n)

func dfs_permutations(_ i: Int) {
    if i == m {
        result.append(temp)
        return
    }
    for j in (0..<n) {
        if !visited[j] {
            temp[i] = cards[j]
            visited[j] = true
            dfs_permutations(i+1)
            visited[j] = false
        }
    }
}

func dfs_combinations_with_replacement(_ i: Int, _ start: Int) {
    if i == m {
        result.append(temp)
        return
    }
    for j in (start..<n) {
        temp[i] = cards[j]
        dfs_combinations_with_replacement(i+1, j)
    }
}

func dfs_product(_ i: Int) {
    if i == m {
        result.append(temp)
        return
    }
    for j in (0..<n) {
        temp[i] = cards[j]
        dfs_product(i+1)
    }
}

var temp_fact: [Int] = Array(repeating: 0, count: n)

func dfs_factorial(_ i: Int) {
    if i == n {
        result.append(temp_fact)
        return
    }
    for j in (0..<n) {
        if !visited[j] {
            temp_fact[i] = cards[j]
            visited[j] = true
            dfs_factorial(i+1)
            visited[j] = false
        }
    }
}

//dfs_combinations(0, 0)
//dfs_permutations(0)
//dfs_combinations_with_replacement(0, 0)
//dfs_product(0)
//dfs_factorial(0)

//print(result.count, result)
