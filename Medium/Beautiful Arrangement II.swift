//Beautiful Arrangement II
    func constructArray(_ n: Int, _ k: Int) -> [Int] {
        var res = [Int]()
        if n <= k {return []}
        var l = 1, r = n
        while res.endIndex < n {
            if k % 2 != 0 {
                res.append(l)
                l += 1
            } else {
                res.append(r)
                r -= 1
            }
            if k > 1 {
                k -= 1
            }
        }
        return res
     }
