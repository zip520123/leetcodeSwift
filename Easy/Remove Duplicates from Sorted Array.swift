//Remove Duplicates from Sorted Array
//O(n), O(1)
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var l = 0, r = 0
        while r < nums.endIndex {
            if nums[l] != nums[r] {
                l += 1
                nums[l] = nums[r]
            }
            r += 1
        }

        return l+1
    }