//Wildcard Matching
//O(s*p) O(s*p)
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s) , pArr = Array(p)
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: sArr.endIndex + 1), count: pArr.endIndex + 1)
        dp[0][0] = true
        var i = 1
        while i <= pArr.endIndex {
            if pArr[i-1] == "*" {
                dp[i][0] = dp[i-1][0]
            } 
            i += 1
        }
        
        i = 1
        while i <= pArr.endIndex {
            var j = 1
            while j <= sArr.endIndex {
                if pArr[i-1] == sArr[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    if pArr[i-1] == "?" {
                        dp[i][j] = dp[i-1][j-1]
                    } else if pArr[i-1] == "*" {
                        dp[i][j] = dp[i-1][j-1] || dp[i][j-1] || dp[i-1][j]
                    }  
                }
                j += 1
            }
            i += 1
        }
        return dp[pArr.endIndex][sArr.endIndex]
    }