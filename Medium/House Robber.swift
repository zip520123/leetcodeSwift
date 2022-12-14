/*House Robber*/
//time O(n) space O(n)
func rob(_ nums: [Int]) -> Int {
    let ncount = nums.count
    if ncount == 0 {return 0}
    if ncount == 1 {return nums[0]}
    if ncount == 2 {return max(nums[0],nums[1])}
    if ncount == 3 {return max(nums[0]+nums[2],nums[1])}
    var dp = Array<Int>(repeating: 0, count: ncount)
    dp[0] = nums[0]
    dp[1] = nums[1]
    dp[2] = nums[2] + nums[0]
    
    for i in 3..<ncount {
        let n = nums[i]
        dp[i] = max(dp[i-2],dp[i-3]) + n
    }
    return max(dp[ncount - 1],dp[ncount - 2])
}

//time O(n) space O(1)
    func rob(_ nums: [Int]) -> Int {
        if nums.endIndex == 0 {
            return 0
        }
        if nums.endIndex == 1 {
            return nums[0]
        }
        if nums.endIndex == 2 {
            return max(nums[0],nums[1])
        }
        var dp0 = nums[0]
        var dp1 = nums[1]
        var dp2 = nums[2] + nums[0]
        
        for i in 3..<nums.endIndex {
            let curr = max(dp0,dp1) + nums[i]
            dp0 = dp1
            dp1 = dp2
            dp2 = curr 
        }
        
        return max(dp1, dp2)
    }

//O(n), O(1)
    func rob(_ nums: [Int]) -> Int {
        if nums.endIndex == 1 {return nums[0]}
        if nums.endIndex == 2 {return max(nums[1],nums[0])}
        var dp1 = nums[0]
        var dp2 = max(nums[1],nums[0])
        
        for i in 2..<nums.endIndex {
            let n = max(dp2,dp1+nums[i])
            dp1 = dp2
            dp2 = n
        }
        return dp2
    }