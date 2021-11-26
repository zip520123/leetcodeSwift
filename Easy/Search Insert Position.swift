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

//O(log n)
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
       var l = 0, r = nums.endIndex
        while l<r {
            let mid = l+(r-l)>>1
            if nums[mid] < target {
                l = mid+1
            } else{
                r = mid
            }
        }
        return l
    }