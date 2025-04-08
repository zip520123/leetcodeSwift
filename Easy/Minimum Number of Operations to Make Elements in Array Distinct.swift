// Minimum Number of Operations to Make Elements in Array Distinct
// O(n*max(nums)), O(n)
func minimumOperations(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    for n in nums {
        dict[n, default: 0] += 1
    }
    var i = 0
    var count = 0
    while Self.haveDuplicate(dict) {
        count += 1
        for delta in 0..<3 {
            if i+delta < nums.endIndex {
                dict[nums[i+delta]]! -= 1 
            }   
        }
        i += 3
    }
    return count
}
static func haveDuplicate(_ dict: [Int: Int]) -> Bool {
    for (key, val) in dict {
        if val > 1 {
            return true
        }
    }
    return false
}