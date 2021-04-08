//Permutations II
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ nums: [Int], _ path: [Int]) {
            var nums = nums
            if nums.endIndex == 0 {
                res.append(path)
            } else {
                for i in 0..<nums.endIndex {
                    if i > 0 && nums[i] == nums[i-1] {continue}
                    let n = nums.remove(at:i)
                    dfs(nums,path+[n])
                    nums.insert(n, at:i)
                }
            }
        }
        dfs(nums.sorted(), [])
        return res
    }