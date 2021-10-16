//Best Time to Buy and Sell Stock III
//O(n), O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var hold1 = -Int.max, hold2 = -Int.max
        var r1 = 0, r2 = 0
        for p in prices {
            r2 = max(r2, hold2+p)
            hold2 = max(hold2, r1 - p)
            r1 = max(r1, hold1+p)
            hold1 = max(hold1, -p)
        }
        return r2
    }