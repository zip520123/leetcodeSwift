//Subsets
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ curr: [Int], _ index: Int) {
            res.append(curr)
            var i = index
            while i < nums.endIndex {
                dfs(curr+[nums[i]], i+1)
                i+=1
            }
        }
        dfs([],0)
        return res
    }