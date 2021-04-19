//Next Permutation
//O(n)
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.endIndex - 2
        while i >= 0 && nums[i] >= nums[i+1] {
            i -= 1
        }
        if i >= 0 {
            var j = nums.endIndex - 1
            
            while j >= 0 && nums[i] >= nums[j] {
                j -= 1
            }
            (nums[i],nums[j]) = (nums[j],nums[i])
        }
        var l = i + 1, r = nums.endIndex - 1
        while l < r {
            (nums[l],nums[r]) = (nums[r],nums[l])
            l += 1
            r -= 1
        }
    }