//Max Consecutive Ones III
//O(n) O(1)
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var l = 0, r = 0
        var count = k
        var ones = 0
        while r < nums.endIndex {
            ones += 1
            if nums[r] == 0 {
                count -= 1
            }
            while count < 0 {
                ones -= 1
                if nums[l] == 0 {
                    count += 1
                }
                l += 1
            }
            res = max(ones,res)
            r += 1
        }
        return res
    
    }