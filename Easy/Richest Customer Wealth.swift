//Richest Customer Wealth
//O(n), O(1)
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var res = 0
        for account in accounts {
            res = max(res, account.reduce(0,+))
        }
        return res
    }