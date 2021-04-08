//Combination Sum II
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        let nums = candidates.sorted()
        func dfs(_ curr:Int, _ path:[Int], _ index: Int, _ nums: [Int]) {
            var nums = nums
            if curr < 0 {return}
            if curr == 0 {
                res.append(path)
                return
            }
            var i = index 
            while i < nums.endIndex {
                if i > index && nums[i] == nums[i-1] {
                    i+=1
                    continue
                }
                let n = nums[i]
                dfs(curr-n,path+[n],i+1,nums)
                
                
                i+=1
            }
            
            
            
        }
        
        dfs(target,[],0,nums)
        return res
    }