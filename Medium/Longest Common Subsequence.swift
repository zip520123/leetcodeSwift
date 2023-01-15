//Longest Common Subsequence
//O(s1*s2), O(s1*s2)
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let sArr1 = Array(text1), sArr2 = Array(text2)
        var dp = (0...sArr1.endIndex).map {_ in (0...sArr2.endIndex).map{_ in 0 }}
        for i in 1...sArr1.endIndex {
            for j in 1...sArr2.endIndex {
                if sArr1[i-1] == sArr2[j-1] {
                    dp[i][j] = max(dp[i-1][j-1]+1, dp[i-1][j], dp[i][j-1])
                } else {
                    dp[i][j] = max(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[sArr1.endIndex][sArr2.endIndex]
    }

//O(s1*s2), O(s1*s2)
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0,count: text2.count+1), count: text1.count+1)
        let arr1 = Array(text1), arr2 = Array(text2)
        for i in 0..<arr1.endIndex {
            for j in 0..<arr2.endIndex {
                if arr1[i] == arr2[j] {
                    dp[i+1][j+1] = dp[i][j]+1
                } else {
                    dp[i+1][j+1] = max(dp[i+1][j],dp[i][j+1])
                }
                
            }
        }
        return dp[arr1.endIndex][arr2.endIndex]
    }