//Ones and Zeroes
//O(n!) O(n) TLE
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var res = 0
        
        func dfs(_ index: Int, _ path: [String]) {
            
            let string = path.joined()
            var zeroCount = 0, oneCount = 0
            for char in string {
                if char == "0" {
                    zeroCount += 1
                }
                if char == "1" {
                    oneCount += 1
                }
            }
            if zeroCount <= m && oneCount <= n {
                res = max(res, path.endIndex)
            }

            for i in index..<strs.endIndex {
                dfs(i+1, path+[strs[i]])    
            }
        }
        
        dfs(0, [])
        
        return res
    }
//O(n!) O(n) TLE
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var res = 0
        
        func dfs(_ curr: Int, _ index: Int, _ currZeros: Int, _ currOnes: Int) {
            if currZeros <= m && currOnes <= n {
                res = max(res, curr)
            } else { return }
            for i in index..<strs.endIndex {
                let s = strs[i]
                var sZeros = 0, sOnes = 0
                for char in s {
                    if char == "0" {
                        sZeros += 1
                    }
                    if char == "1" {
                        sOnes += 1
                    }
                }
                dfs(curr+1,i+1,currZeros+sZeros,currOnes+sOnes)
            }
        }
        dfs(0,0,0,0)
        return res
    }

//O(strs.length * n * m) O(strs.length * n * m) TLE
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        
        var dict = [[Int]:Int]()
        
        func dfs(_ index: Int, _ currZeros: Int, _ currOnes: Int) -> Int {
            
            if dict[[index,currZeros,currOnes]] != nil {
                return dict[[index,currZeros,currOnes]]!
            }
            var res = 0
            for i in index..<strs.endIndex {
                let s = strs[i]
                var sZeros = 0, sOnes = 0
                for char in s {
                    if char == "0" {
                        sZeros += 1
                    }
                    if char == "1" {
                        sOnes += 1
                    }
                }
                if currZeros+sZeros <= m && currOnes+sOnes <= n {
                    res = max(res,dfs(i+1,currZeros+sZeros,currOnes+sOnes)+1)    
                }
                
            }
            dict[[index,currZeros,currOnes]] = res
            return res
        }
        
        return dfs(0,0,0)
    }
//O(l*m*n) O(m*n)
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating:[Int](repeating:0, count: n+1), count:m+1)
        for str in strs {
            var zeros = 0, ones = 0
            for char in str {
                if char == "0" {
                    zeros += 1
                }
                if char == "1" {
                    ones += 1
                }
            }
            var zero = m 
            while zero >= zeros {
                var one = n
                while one >= ones {
                    dp[zero][one] = max(dp[zero][one], dp[zero - zeros][one - ones] + 1)
                    one -= 1
                }
                zero -= 1
            }
            
        }
        return dp[m][n]
    }