//Consecutive Characters
//O(n), O(n)
    func maxPower(_ s: String) -> Int {
        var l = 0, r = 0
        let arr = Array(s)
        var res = 0
        while r<arr.endIndex {
            let char = arr[r]
            
            if char != arr[l] {
                l = r
            }
            res = max(res, r-l+1)
            r += 1
        }
        return res
    }