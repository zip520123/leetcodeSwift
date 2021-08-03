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

    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted()
        func dfs(_ path:[Int], _ index: Int) {
            res.append(path)
            var prev: Int?
            for i in index..<nums.endIndex {
                let curr = nums[i]
                if prev != nil && curr == prev! {continue}
                prev = curr
                dfs(path+[curr], i+1)
            }
        }
        dfs([], 0)
        return res
    }