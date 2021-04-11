//Edit Distance
    func minDistance(_ word1: String, _ word2: String) -> Int {
        
        var dp = [[Int]](repeating:[Int](repeating:0,count:word1.count+1),count:word2.count+1)
        let w1 = Array(word1)
        let w2 = Array(word2)
        if w1.endIndex == 0 {return w2.endIndex}
        if w2.endIndex == 0 {return w1.endIndex}
        for i in 1...word1.count {
            dp[0][i] = i
        }
        for i in 1...word2.count {
            dp[i][0] = i
        }
        
        for i in 1...word2.count {
            for j in 1...word1.count {
                let char1 = w1[j - 1]
                let char2 = w2[i - 1]
                if char1 == char2 {
                    dp[i][j] = dp[i-1][j-1]
                }else {
                    dp[i][j] = min(dp[i-1][j-1],dp[i-1][j],dp[i][j-1]) + 1   
                }
                
            }
        }
        return dp[w2.endIndex][w1.endIndex]
    }