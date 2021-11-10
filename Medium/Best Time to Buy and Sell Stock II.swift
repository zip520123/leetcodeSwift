//Best Time to Buy and Sell Stock II
//O(n), O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        for i in 1..<prices.endIndex {
            if prices[i] - prices[i-1] > 0 {
                res += prices[i] - prices[i-1]
            }
        }
        return res
    }