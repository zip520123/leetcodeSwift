//Number of Dice Rolls With Target Sum
//O(n*k), O(n*k)
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var dict = [[Int]:Int]()
        let mod = Int(1E9+7)
        func dfs(_ curr: Int, _ i: Int) -> Int {
            if let dp = dict[[curr, i]] {
                return dp
            }
            if i == n {
                if curr == target {
                    return 1
                }
                return 0
            }
            
            var res = 0
            for num in 1...k {
                res += dfs(curr+num, i+1) % mod
            }
            dict[[curr,i]] = res % mod
            return res % mod
        }
        
        return dfs(0,0)
    }

//bottom up
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: target+1), count: n+1)
        let mod = Int(1E9+7)
        dp[0][0] = 1
        for dict in 1...n {
            for num in 1...k {
                for currTarget in 1...target {
                    if num <= currTarget {
                        dp[dict][currTarget] = (dp[dict][currTarget] + dp[dict-1][currTarget-num]) % mod
                    }
                }
            }
        }
        return dp[n][target]
    }