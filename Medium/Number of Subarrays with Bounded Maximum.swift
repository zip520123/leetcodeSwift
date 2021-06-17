//Number of Subarrays with Bounded Maximum
//O(n), O(1)
    func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var res = 0, l = -1, r = -1
        for i in 0..<nums.endIndex {
            if nums[i] > right {l = i}
            if nums[i] >= left {r = i}

            res += r - l
        }
        return res
    }