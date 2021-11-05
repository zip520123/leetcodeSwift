//Arranging Coins
//O(log n)
    func arrangeCoins(_ n: Int) -> Int {
        var l = 0, r = n
        while l<=r {
            let k = l+(r-l)>>1
            let curr = k*(k+1) / 2
            if curr == n {return k}
            if curr < n {
                l = k+1
            } else {
                r = k-1
            }
        }
        return r
    }
    
//O(1)
    func arrangeCoins(_ n: Int) -> Int {
        Int(sqrt(2 * Double(n) + 0.25) - 0.5)
    }