/*Search Insert Position*/
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if target > nums[nums.endIndex - 1] {return nums.endIndex}
    var left = 0, right = nums.endIndex - 1
    while left < right {
        let mid = left + (right - left) >> 1
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
}