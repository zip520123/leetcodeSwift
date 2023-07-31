// Minimum ASCII Delete Sum for Two Strings
// O(s1.len*s2.len), O(s1.len*s2.len)
class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let arr1 = Array(s1), arr2 = Array(s2)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: arr1.endIndex+1), count: arr2.endIndex+1)
        for i in 1...arr1.endIndex {
            dp[0][i] = dp[0][i-1] + ascii(arr1[i-1])
        }
        for i in 1...arr2.endIndex {
            dp[i][0] = dp[i-1][0] + ascii(arr2[i-1])
        }

        for i in 1...arr2.endIndex {
            for j in 1...arr1.endIndex {
                if arr1[j-1] == arr2[i-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i][j-1] + ascii(arr1[j-1]), dp[i-1][j] + ascii(arr2[i-1]), ascii(arr1[j-1]) + ascii(arr2[i-1]) + dp[i-1][j-1] )
                }
                
            }
        }
        return dp[arr2.endIndex][arr1.endIndex]
    }

    func ascii(_ char: Character) -> Int {
        Int(char.asciiValue!)
    }
}