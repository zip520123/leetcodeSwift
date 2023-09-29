// Monotonic Array
// O(n), O(1)
func isMonotonic(_ nums: [Int]) -> Bool {
    var increasing = true
    for i in 0..<nums.endIndex-1 {
        increasing = increasing && nums[i] <= nums[i+1]
    }
    var decreasing = true
    for i in 0..<nums.endIndex-1 {
        decreasing = decreasing && nums[i] >= nums[i+1]
    }
    return increasing || decreasing
}