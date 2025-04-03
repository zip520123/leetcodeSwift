// Maximum Value of an Ordered Triplet II
// O(n), O(n)
func maximumTripletValue(_ nums: [Int]) -> Int {
    let n = nums.endIndex
    var prefix_max = nums.map { $0 }
    var suffix_max = nums.map { $0 }
    for i in 1..<n {
        prefix_max[i] = max(prefix_max[i-1], nums[i])
    }
    for i in (0..<n-1).reversed() {
        suffix_max[i] = max(suffix_max[i+1], nums[i])
    }
    var res = 0
    for i in 1..<(n-1) {
        res = max(res, (prefix_max[i-1] - nums[i]) * suffix_max[i+1])
    }
    return res
}