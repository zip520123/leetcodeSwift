//Maximum Size Subarray Sum Equals k
//O(n) O(n)
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var dict = [0:-1]
        var sum = 0, res = 0  
        for (i,n) in nums.enumerated() {
            sum += n
            if dict[sum-k] != nil {
                res = max(res, i - dict[sum-k]!)
            }
            if dict[sum] == nil {
                dict[sum] = i    
            }
            
        }
        return res
    }