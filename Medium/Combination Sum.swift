/*Combination Sum*/
//time O(n!) space O(n)
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ path: [Int], _ rest: Int, _ index: Int) {
            if rest < 0 {return}
            if rest == 0 {
                res.append(path)
                return
            }
            for i in index..<candidates.endIndex {
                let n = candidates[i]
                dfs(path+[n], rest-n, i)
            }
        }
        dfs([], target, 0)
        return res
    }

