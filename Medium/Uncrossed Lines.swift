//Uncrossed Lines
//O(n1*n2), O(n1*n2)
    func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums2.endIndex+1), count: nums1.endIndex+1)
        for i in 1...nums1.endIndex {
            for j in 1...nums2.endIndex {
                if nums1[i-1] == nums2[j-1] {
                    dp[i][j] = max(dp[i-1][j-1]+1, dp[i-1][j], dp[i][j-1])
                } else {
                    dp[i][j] = max(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])
                }
                
            }
        }
        return dp[nums1.endIndex][nums2.endIndex]
    }