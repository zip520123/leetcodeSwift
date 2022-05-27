//Number of Steps to Reduce a Number to Zero
//O(log n)
    func numberOfSteps(_ num: Int) -> Int {
        var n = num, res = 0
        while n > 0 {
            res += 1
            if n % 2 == 1 {
                n -= 1
            } else {
                n = n >> 1    
            }
            
        }
        return res
    }