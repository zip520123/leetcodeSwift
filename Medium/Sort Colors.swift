//Sort Colors
//O(n), O(1)
    func sortColors(_ nums: inout [Int]) {
        var l = 0, r = nums.endIndex-1, i = 0
        while i<=r {
            if nums[i] == 0 {
                (nums[l], nums[i]) = (nums[i],nums[l])  
                l += 1
                i += 1
            } else if nums[i] == 1 {
                i += 1
            } else {
                (nums[i], nums[r]) = (nums[r], nums[i])
                r -= 1
            }   
        }
    }