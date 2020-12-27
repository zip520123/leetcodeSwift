/*Best Time to Buy and Sell Stock*/
//time O(n^2) space O(1)
func maxProfit(_ prices: [Int]) -> Int {
    let pcount = prices.count
    if pcount < 1 {
        return 0
    }
    var res = 0
    for i in 0..<pcount - 1 {
        for j in i+1..<pcount {
            if prices[j] - prices[i] > res {
                res = prices[j] - prices[i]
            }
        }
    }
    
    return res
}

//time O(n) space O(1)
func maxProfit(_ prices: [Int]) -> Int {
    let pcount = prices.count
    if pcount < 1 {
        return 0
    }
    var min = Int.max
    var res = 0
    for item in prices {
        min = item < min ? item : min
        let currProfit = item - min
        res = max(currProfit, res)
    }
    
    return res
}

func maxProfit(_ prices: [Int]) -> Int {
    let pcount = prices.count
    if pcount <= 1 {return 0}
    var min = prices[0]
    var res = 0
    for i in 1..<pcount {
        let n = prices[i]
        if n < min {
            min = n
        }
        if n - min > res {
            res = n - min
        }
    }
    return res
}