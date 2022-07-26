//Combination Sum III
//O(2^n), O(2^n)
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

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ count: Int, _ index: Int, _ path: [Int], _ sum: Int) {
            if count == k {
                if sum == n {
                    res.append(path)
                }
                return
            }
            var i = index
            while i <= 9 {
                if sum + i <= n {
                    dfs(count+1, i+1, path+[i], sum+i)
                }
                i += 1
            }
        }
        dfs(0,1,[],0)
        return res
    }