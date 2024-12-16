// Final Array State After K Multiplication Operations I
// O(n*k), O(n)
func getFinalState(_ nums: [Int], _ k: Int, _ multiplier: Int) -> [Int] {
    var nums = nums
    for _ in 0..<k {
        var min_n = Int.max, min_i = 0
        for i in 0..<nums.endIndex {
            if nums[i] < min_n {
                min_n = nums[i]
                min_i = i
            }
        }
        nums[min_i] *= multiplier
    }
    return nums
}