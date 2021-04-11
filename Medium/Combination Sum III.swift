//Combination Sum III
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ path:[Int], _ curr: Int, _ index: Int) {
            if curr == 0 {
                if path.endIndex == k {
                    res.append(path)    
                }
                return
            }
            if path.endIndex == k {
                return
            }
            if index == 10 {return}
            for i in index...9 {
                if curr - i >= 0 {
                    dfs(path+[i], curr-i, i+1)
                }
            }
        }
        dfs([],n,1)
        return res
    }