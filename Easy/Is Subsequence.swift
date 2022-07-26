/*Is Subsequence*/
//time O(s*t) space O(s*t)
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let tArr = Array(t), sArr = Array(s)
        var dp = [[Bool]](repeating:[Bool](repeating:false,count:tArr.endIndex + 1), count:sArr.endIndex + 1)
        
        if s == "" {return true}
        if t == "" {return false}
        for i in 0..<tArr.endIndex {
            dp[0][i] = true
        }
        for i in 1...sArr.endIndex {
            for j in 1...tArr.endIndex {
                if sArr[i - 1] == tArr[j - 1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = dp[i][j-1]
                }
            }
        }

        return dp[sArr.endIndex][tArr.endIndex]
    }
//O(s+t) O(1)
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var l = 0, r = 0
        let sArr = Array(s), tArr = Array(t)
        if s == "" {return true}
        if t == "" {return false}
        while r < tArr.endIndex {
            if sArr[l] == tArr[r] {
                l += 1
                if l == sArr.endIndex {
                    return true
                }
            }
            r += 1
        }
        return false
    }
//O(t), O(1)
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var l = 0
        let arrS = Array(s), arrT = Array(t)
        if s == "" {return true}
        for r in 0..<arrT.endIndex {
            if arrS[l] == arrT[r] {
                l += 1
                if l == arrS.endIndex {break}
            }
        }
        return l == arrS.endIndex
    }