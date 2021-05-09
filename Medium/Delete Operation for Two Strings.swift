//Delete Operation for Two Strings
//O(w1 * w2) O(w1 * w2)
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let w1 = Array(word1), w2 = Array(word2)
        var dp = (0...w1.endIndex).map {_ in (0...w2.endIndex).map{_ in 0} }
        dp[0][0] = 0
        var i = 1
        while i <= w2.endIndex {
            dp[0][i] = i
            i += 1
        }
        i = 1
        while i <= w1.endIndex {
            dp[i][0] = i
            i += 1
        }
        i = 1
        while i <= w1.endIndex {
            var j = 1
            while j <= w2.endIndex {
                if w1[i-1] == w2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + 1
                } 
                j += 1
            }
            i += 1
        }
        return dp[w1.endIndex][w2.endIndex]
    }
}