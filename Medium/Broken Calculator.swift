//Broken Calculator
//O(n), O(1)
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        var res = 0
        var t = target
        while t > startValue {
            res += 1
            if t % 2 == 1 {
                t += 1
            } else {
                t /= 2
            }
        }
        return res + startValue - t
    }