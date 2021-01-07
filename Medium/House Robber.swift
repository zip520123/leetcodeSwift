/*House Robber*/
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