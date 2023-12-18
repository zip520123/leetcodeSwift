// Maximum Product Difference Between Two Pairs
// O(n log n), O(n)
func maxProductDifference(_ nums: [Int]) -> Int {
    let arr = nums.sorted()
    let n = arr.endIndex
    return arr[n-1]*arr[n-2]-arr[0]*arr[1]
}