//One Edit Distance
//O(s*t) O(s*t) TLE
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        let sArr = Array(s) , tArr = Array(t)
        if s == "" {return tArr.endIndex == 1}
        if t == "" {return sArr.endIndex == 1}
        var dp = [[Int]](repeating: [Int](repeating: 0, count: sArr.endIndex+1), count: tArr.endIndex+1)
        for i in 1...sArr.endIndex {
            dp[0][i] = i
        }
        for i in 1...tArr.endIndex {
            dp[i][0] = i
        }
        for i in 1...tArr.endIndex {
            for j in 1...sArr.endIndex {
                if sArr[j-1] == tArr[i-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i][j-1],dp[i-1][j],dp[i-1][j-1]) + 1
                }
                
            }
        }    
        return dp[tArr.endIndex][sArr.endIndex] == 1
    }

//O(s+t) O(s+t)
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        var sArr = Array(s), tArr = Array(t)
        
        var l = 0, r = 0
        while l < sArr.endIndex && r < tArr.endIndex && sArr[l] == tArr[r] {
            l += 1
            r += 1    
        }
        
        if l == sArr.endIndex && r == tArr.endIndex {return false} // check if two string are the same
        
        if sArr.endIndex > tArr.endIndex { // insert one
            return sArr[(l+1)...] == tArr[r...]
        } else if sArr.endIndex < tArr.endIndex { // delete one
            return sArr[l...] == tArr[(r+1)...]
        } else {
            return sArr[(l+1)...] == tArr[(r+1)...] //replace one
        }
        
    }
