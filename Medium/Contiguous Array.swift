//Contiguous Array
//O(n), O(n)
    func findMaxLength(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        dict[0] = -1
        var count = 0, res = 0
        for i in 0..<nums.endIndex {
            count += nums[i] == 1 ? 1 : -1
            if dict[count] == nil {
                dict[count] = i
            } else {
                res = max(res, i - dict[count]!)
            }
        }
        return res
    }