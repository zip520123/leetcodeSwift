//Single Number
//O(n), O(1)
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for n in nums {
            res ^= n
        }
        return res
    }