//Find Peak Element
//O(n) O(n)
    func findPeakElement(_ nums: [Int]) -> Int {
        let nums = ([-Int.max] + nums + [-Int.max])
        for (i,n) in nums.enumerated() {
            if i != 0 && i != nums.endIndex - 1{
                if n > nums[i-1] && n > nums[i+1] {
                    return i - 1
                }
            } 
        }
        return nums[0]
    }
//O(n) O(1)
    func findPeakElement(_ nums: [Int]) -> Int {
        for i in 0..<nums.endIndex - 1 {
            if nums[i] > nums[i+1] {
                return i
            }
        }
        return nums.endIndex - 1
    }

//O(log n) O(1)
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0, r = nums.endIndex - 1
        while l < r {
            let mid = (l+r)>>1
            if nums[mid] > nums[mid+1] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }