/*Maximum Subarray*/
//time O(n) space O(n)
func maxSubArray(_ nums: [Int]) -> Int {
    let ncount = nums.count
    var dp = Array(repeating: 0, count: ncount)
    dp[0] = nums[0] 
    var res = nums[0]
    for i in 1..<nums.count {
        let n = nums[i]
        dp[i] = max(n, dp[i-1] + n) 
        res = max(res,dp[i])
    }
    return res
}
//time O(n) space O(1)
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.endIndex == 0 {return 0}
    var prev = nums[0]
    var res = nums[0]
    for i in 1..<nums.endIndex {
        prev = max(nums[i], nums[i] + prev)
        res = max(res,prev)
    }
    return res    
}