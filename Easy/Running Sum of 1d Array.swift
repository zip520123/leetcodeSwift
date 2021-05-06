//Running Sum of 1d Array
//O(n) O(n)
    func runningSum(_ nums: [Int]) -> [Int] {
        var nums = nums
        for i in 1..<nums.endIndex {
            nums[i] += nums[i-1]
        }
        return nums
    }