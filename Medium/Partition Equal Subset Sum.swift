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