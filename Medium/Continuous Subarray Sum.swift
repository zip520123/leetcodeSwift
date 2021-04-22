//Continuous Subarray Sum
//O(n) O(n)
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [0:-1]
        
        var sum = 0
        for (i,n) in nums.enumerated() {
            sum += n
            if let index = dict[sum % k] {
                if i - index > 1 {
                    return true
                }
            } else {
                dict[sum % k] = i    
            }
        }
        return false
    }