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
//
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var l = 0, r = 0, res = 0, k = k
        while r < nums.endIndex {
            if nums[r] == 0 {
                k -= 1
                while k == -1 {
                    if nums[l] == 0 {
                        k += 1
                    }
                    l += 1
                }
            }
            res = max(res, r-l+1)
            r += 1
        }
        return res
    }