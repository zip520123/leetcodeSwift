/*Combination Sum*/
//time O(n!) space O(n)
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        let nums = candidates
        func dfs(_ curr:Int, _ path:[Int], _ index: Int) {
            if curr < 0 {return}
            if curr == 0 {
                res.append(path)
                return
            }
            
            for i in index..<nums.endIndex {
                let n = nums[i]
                dfs(curr - n, path+[n], i)
            }
            
        }
        
        dfs(target,[],0)
        return res
    }

