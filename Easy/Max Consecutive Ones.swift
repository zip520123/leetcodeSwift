//Max Consecutive Ones
//O(n), O(1)
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var res = 0
        var l = 0, r = 0
        while r < nums.endIndex {
            if nums[r] == 0 {
                l = r+1
            }
            res = max(r-l+1,res)
            r += 1
        }
        return res
    }