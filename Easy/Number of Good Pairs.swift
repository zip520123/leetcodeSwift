// Number of Good Pairs
// O(n), O(1)
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var res = 0
        for i in 0..<nums.endIndex-1 {
            for j in i+1..<nums.endIndex {
                if nums[i] == nums[j] { res += 1 }
            }
        }
        return res
    }