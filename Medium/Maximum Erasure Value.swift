//Maximum Erasure Value
//O(n), O(n), n = nums.len
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var seen = [Int: Int]()
        var l = 0, r = 0, sum = 0, res = 0
        while r < nums.endIndex {
            if let index = seen[nums[r]] {
                while l <= index {
                    seen[nums[l]] = nil
                    sum -= nums[l]
                    l += 1
                }
            }
            seen[nums[r]] = r
            sum += nums[r]
            res = max(res, sum)
            r += 1
        }
        return res
    }