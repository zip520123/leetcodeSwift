//Minimum Swaps to Group All 1's Together
//O(n) O(1)
    func minSwaps(_ data: [Int]) -> Int {
        var onesCount = 0
        for n in data {
            if n == 1 {
                onesCount += 1
            }
        }
        if onesCount == 0 {return 0}
        var res = data.endIndex
        
        var l = 0, r = 0
        var zeroCount = 0
        while r < data.endIndex {
            if data[r] == 0 {
                zeroCount += 1
            }
            if r - l + 1 == onesCount {
                res = min(zeroCount, res)
                if data[l] == 0 {
                    zeroCount -= 1
                }
                l += 1
            }
            r += 1
        }
        return res
    }