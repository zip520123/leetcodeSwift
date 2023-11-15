// Maximum Element After Decreasing and Rearranging
// O(n log n), O(n)
func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
    var arr = arr.sorted()
    if arr[0] != 1 { arr[0]=1 }
    for i in 1..<arr.endIndex {
        if abs(arr[i]-arr[i-1]) > 1 {
            arr[i] = arr[i-1]+1
        }
    }
    return arr[arr.endIndex-1]
}