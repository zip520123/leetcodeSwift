//Distinct Subsequences
//O(s*t), O(s*t), Overflow
    func numDistinct(_ s: String, _ t: String) -> Int {

        let sArr = Array(s), tArr = Array(t)
        var dp = (0...(tArr.endIndex+1)).map {_ in (0...(sArr.endIndex+1)).map {_ in 0 }}
        
        for i in 0...sArr.endIndex {
            dp[0][i] = 1
        }
        
        for i in 1...tArr.endIndex {
            for j in 1...sArr.endIndex {
                dp[i][j] = dp[i-1][j]
                if tArr[i-1] == sArr[j-1] {
                    dp[i][j] += dp[i-1][j-1]
                } 
            }
        }
        return dp[tArr.endIndex][sArr.endIndex]
    }

//O(s*t), O(s*t)
    func numDistinct(_ s: String, _ t: String) -> Int {

        let sArr = Array(s), tArr = Array(t)
        var dp = (0...sArr.endIndex+1).map {_ in (0...tArr.endIndex+1).map {_ in 0 }}
        
        for i in 0...sArr.endIndex {
            dp[i][0] = 1
        }
            
        for i in 1...sArr.endIndex {
            for j in 1...tArr.endIndex {
                dp[i][j] = dp[i-1][j]
                if sArr[i-1] == tArr[j-1] {
                    if Int.max - dp[i-1][j-1] - dp[i][j] > 0 { //prevent overflow case
                        dp[i][j] += dp[i-1][j-1]
                    } else {
                        dp[i][j] = 0
                    }
                } 
            }
        }
        return dp[sArr.endIndex][tArr.endIndex]
    }