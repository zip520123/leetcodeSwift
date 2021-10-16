// Best Time to Buy and Sell Stock with Cooldown
//O(n), O(n)
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = [[0,0,0]]
        dp[0][0] = -prices[0]
        for i in 1..<prices.endIndex {
            dp.append([0,0,0])
            dp[i][0] = max(dp[i-1][0], dp[i-1][2] - prices[i])
            dp[i][1] = max(dp[i-1][1], dp[i-1][0] + prices[i])
            dp[i][2] = dp[i-1][1] 
        }
        return dp.last![1]
    }
}
/*
own stock day dp[i][0] = max(dp[i-1][0], dp[i-1][2] - prices[i]) buy from cooldown day
no own day    dp[i][1] = max(dp[i-1][1], dp[i-1][0] + prices[i]) sell from own stock day
cooldown day  dp[i][2] = dp[i-1][1] cooldown from sell day

*/
//O(n), O(1)
func maxProfit(_ prices: [Int]) -> Int {
    var own = -prices[0]
    var notOwn = 0
    var coolDown = 0
    
    for i in 1..<prices.endIndex {
        let preOwn = own
        let preNotOwn = notOwn
        let preCoolDown = coolDown
        own = max(preOwn, preCoolDown - prices[i])
        notOwn = max(preNotOwn, preOwn + prices[i])
        coolDown = preNotOwn
    }
    return notOwn
}