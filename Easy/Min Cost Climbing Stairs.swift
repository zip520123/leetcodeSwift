//Min Cost Climbing Stairs
//dp 
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = [0,0]
    for i in 2...cost.endIndex {
        dp.append(min(dp[i-1]+cost[i-1],dp[i-2]+cost[i-2]))
    }
    return dp[dp.endIndex - 1]
}