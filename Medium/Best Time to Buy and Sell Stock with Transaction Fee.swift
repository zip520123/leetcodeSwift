// Best Time to Buy and Sell Stock with Transaction Fee
//O(n), O(n)
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.endIndex
        var buy = (0..<n).map {_ in 0}
        var sell = (0..<n).map {_ in 0}
        var keep = (0..<n).map {_ in 0}
        buy[0] = -prices[0]
        keep[0] = -prices[0]
        for i in 1..<n {
            buy[i] = sell[i-1]-prices[i]
            sell[i] = max(sell[i-1], max(buy[i-1], keep[i-1]) + prices[i] - fee)
            keep[i] = max(keep[i-1],buy[i-1])
        }

        return sell[n-1]
    }

//O(n), O(1)
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.endIndex
        var buy = -prices[0]
        var sell = 0
        var keep = -prices[0]

        for i in 1..<n {
            let prevBuy = buy
            let prevSell = sell
            let prevKeep = keep
            buy = prevSell-prices[i]
            sell = max(prevSell, max(prevBuy, prevKeep) + prices[i] - fee)
            keep = max(prevKeep, prevBuy)
        }

        return sell
    }