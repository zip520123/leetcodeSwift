// Element Appearing More Than 25% In Sorted Array
// O(n), O(1)
func findSpecialInteger(_ arr: [Int]) -> Int {
    var curr = 0
    for i in 0..<arr.endIndex {
        if i == 0 || arr[i-1] != arr[i] {
            curr = 1
        } else {
            curr += 1
        }
        if curr > arr.endIndex / 4 {
            return arr[i]
        }
    }
    return 0
}