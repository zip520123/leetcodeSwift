// Count Subarrays of Length Three With a Condition
// O(n), O(1)
func countSubarrays(_ nums: [Int]) -> Int {
    var res = 0
    for i in 0..<(nums.endIndex - 2) {
        let a = nums[i], b = nums[i+1], c = nums[i+2]
        if (a+c) * 2 == b {
            res += 1
        }
    }
    return res
}