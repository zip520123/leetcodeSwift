//Remove Duplicates from Sorted Array II
//O(n), O(1)
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var l = 0, r = 0, count = 0
        while r<nums.endIndex {
            if nums[l] == nums[r] {
                count += 1
                
                if count >= 3 {
                    nums.remove(at: r)
                } else {
                    r += 1    
                }
            } else {
                count = 0
                l = r
            }
            
        }
        return nums.endIndex
    }