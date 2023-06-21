// K Radius Subarray Averages
// O(n),O(1)
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 0 {
            return nums
        }
        let n = nums.endIndex
        var res = (0..<n).map {_ in -1}
        if n < 2*k+1 {
            return res
        }
        var currSum = nums[..<(2*k+1)].reduce(0, +)
        res[k] = currSum / (2*k+1)
        for i in (2*k+1..<n) {
            currSum = currSum - nums[i-(2*k+1)] + nums[i]
            res[i-k] = currSum / (2*k+1)
        }
        return res
    }