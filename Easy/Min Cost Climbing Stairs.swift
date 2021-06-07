//Min Cost Climbing Stairs
//dp 
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = [0,0]
    for i in 2...cost.endIndex {
        dp.append(min(dp[i-1]+cost[i-1],dp[i-2]+cost[i-2]))
    }
    return dp[dp.endIndex - 1]
}

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = (0...cost.endIndex).map {_ in 0}
    var i = 2
    while i < dp.endIndex {
        dp[i] = min(dp[i-2]+cost[i-2],dp[i-1]+cost[i-1])
        i += 1
    }
    return dp.last!
}