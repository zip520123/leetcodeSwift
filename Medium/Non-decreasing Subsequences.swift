//Non-decreasing Subsequences
//O(2^n*n^2), O(2^n*n)
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var path = [Int]()
        var res = Set<[Int]>()
        
        func dfs(_ index: Int) {
            if index == nums.endIndex {
                if path.endIndex>=2 {
                    res.insert(path)    
                }    
                return 
            }
            
            if path.isEmpty || path.last! <= nums[index] {
                path.append(nums[index])
                dfs(index+1)
                path.removeLast()
            }
            
            dfs(index+1)
        }
        dfs(0)
        return Array(res)
    }