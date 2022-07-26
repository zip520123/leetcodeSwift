//Arithmetic Slices
//O(n),O(1)
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var res = 0, curr = 0
        if nums.endIndex < 2 {return 0}
        for i in 2..<nums.endIndex {
            if nums[i]-nums[i-1] == nums[i-1]-nums[i-2] {
                curr += 1
                res += curr
            } else {
                curr = 0
            }
        }
        return res
    }