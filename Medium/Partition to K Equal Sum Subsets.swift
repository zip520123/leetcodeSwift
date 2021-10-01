//Partition to K Equal Sum Subsets
//O(k * 2^n)
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % k != 0 {return false}
        let subsum = sum / k
        let nums = nums.sorted()
        var visited = (0..<nums.endIndex).map {_ in false}
        func dfs(_ restK: Int, _ curr: Int, _ index: Int) -> Bool {
            if restK == 1 {return true}
            if curr == subsum {
                return dfs(restK-1, 0, 0)
            }
            for i in index..<nums.endIndex {
                if visited[i] == false && curr+nums[i] <= subsum {
                    visited[i] = true
                    if dfs(restK, curr+nums[i], i+1) == true {return true}
                    visited[i] = false
                }
            }
            return false
        }
        return dfs(k, 0, 0)
    }