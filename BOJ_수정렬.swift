// quick sort - basic
import Foundation


func main() {
    let n = Int(readLine()!)!
    var arr: [Int] = []
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    func partition(_ left: Int, _ right: Int) -> Int {
        let pivot = arr[left]
        var (i, j) = (left, right)
        while i < j {
            while i < j && pivot < arr[j] {
                j -= 1
            }
            while i < j && arr[i] <= pivot {
                i += 1
            }
            (arr[i], arr[j]) = (arr[j], arr[i])
        }
        
        arr[left] = arr[i]
        arr[i] = pivot
        return i
    }
    
    func quickSort(_ left: Int, _ right: Int) {
        if left >= right { return }
        
        let pivotPos = partition(left, right)
        quickSort(left, pivotPos-1)
        quickSort(pivotPos+1, right)
    }
    
    quickSort(0, n-1)
    
    for num in arr {
        print(num)
    }
}
