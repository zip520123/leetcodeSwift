//Subsets II
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted()
        func dfs(_ curr:[Int], _ index: Int) {
            res.append(curr)
            var i = index
            while i < nums.endIndex {
                if i>index && nums[i] == nums[i-1] {
                    i+=1
                    continue
                }
                dfs(curr+[nums[i]],i+1)
                i+=1
            }
        }
        dfs([],0)
        return res
    }