//Maximum Gap
//O(n log n), O(n)
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.endIndex < 2 {return 0}
        let nums = nums.sorted()
        var res = 0
        for i in 0..<nums.endIndex-1 {
            res = max(res, nums[i+1]-nums[i])
        }
        return res
    }