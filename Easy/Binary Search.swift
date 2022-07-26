//Binary Search
//O(log n), O(1)
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.endIndex-1
        while l<r {
            let mid = l+(r-l)>>1
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }
            
        }
        return nums[l] == target ? l : -1
    }