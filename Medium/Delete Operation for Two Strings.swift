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

//O(w1 * w2), O(w1 * w2)
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var mat = [[Int]](repeating: [Int](repeating: 0, count: word1.count+1), count: word2.count+1)
        let arr1 = Array(word1), arr2 = Array(word2)
        for i in 0...arr1.endIndex {
            mat[0][i] = i
        }
        for i in 0...arr2.endIndex {
            mat[i][0] = i
        }
        for i in 1...arr2.endIndex {
            for j in 1...arr1.endIndex {
                let l = arr2[i-1], r = arr1[j-1]
                if l == r {
                    mat[i][j] = mat[i-1][j-1]
                } else {
                    mat[i][j] = min(mat[i-1][j], mat[i][j-1]) + 1
                }
            }
        }
        return mat[word2.count][word1.count]
    }