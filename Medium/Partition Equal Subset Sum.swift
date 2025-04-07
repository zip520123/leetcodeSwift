// Partition Equal Subset Sum
// 
    func canPartition(_ nums: [Int]) -> Bool {
        let nums = nums.sorted()
        let sum = nums.reduce(0,+)
        if sum%2 == 1 {return false}
        var dict = [[Int]: Bool]()
        func dfs(_ curr: Int, _ index: Int) -> Bool {
            if dict[[curr, index]] != nil {
                return dict[[curr, index]]!
            }
            if curr*2 == sum { return true }
            if curr*2 > sum { return false }
            var res = false
            for i in index..<nums.endIndex {
                res = res || dfs(curr+nums[i], i+1)
            }
            dict[[curr, index]] = res
            return res
        }
        
        return dfs(0, 0)
    }

//    
    func canPartition(_ nums: [Int]) -> Bool {        
        let sum = nums.reduce(0,+)
        if sum%2 == 1 {return false}
        var dict = [[Int]: Bool]()
        func dfs(_ curr: Int, _ index: Int) -> Bool {
            if dict[[curr, index]] != nil {
                return dict[[curr, index]]!
            }
            if curr*2 == sum {
                return true
            }
            if curr*2 > sum || index >= nums.endIndex{ 
                return false
            }
            
            let res = dfs(curr+nums[index], index+1) || dfs(curr, index+1)
            
            dict[[curr, index]] = res
            return res
        }
        
        return dfs(0, 0)
    }

// O(sum*n), O(sum*n)
func canPartition(_ nums: [Int]) -> Bool {
    var sum = nums.reduce(0,+)
    if sum % 2 == 1 {
        return false
    }
    var dict = [[Int]: Bool]()
    func dfs(_ curr_sum: Int, _ index: Int) -> Bool {
        if dict[[curr_sum, index]] != nil {
            return dict[[curr_sum, index]]!
        }
        if index == nums.endIndex {
            return false
        }
        if curr_sum * 2 > sum {
            return false
        }
        if curr_sum * 2 == sum {
            return true
        }
        var res = false
        if dfs(curr_sum+nums[index], index+1) {
            res = true
        }
        if dfs(curr_sum, index+1) {
            res = true
        }
        dict[[curr_sum, index]] = res
        return dict[[curr_sum, index]]!
    }
    return dfs(0, 0)
}

// Optimized DP Solution, O(n*sum), O(sum)
func canPartitionOptimized(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)
    if sum % 2 != 0 {
        return false
    }
    let target = sum / 2
    var dp = [Bool](repeating: false, count: target + 1)
    dp[0] = true

    for num in nums {
        for i in (0...target).reversed() {
            if i-num >= 0 {
                dp[i] = dp[i] || dp[i-num]
            }
        }
    }
    return dp[target]
}