//Maximum Length of Repeated Subarray
//O(n1*n2), O(n1*n2)
class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = (0...nums1.endIndex).map{_ in (0...nums2.endIndex).map{_ in 0 }}
        var res = 0
        for i in 1...nums1.endIndex {
            for j in 1...nums2.endIndex {
                if nums1[i-1] == nums2[j-1] {
                    dp[i][j] = dp[i-1][j-1]+1
                    res = max(res, dp[i][j])
                }
            }
        }
        return res
    }
}

//O(n1*n2), O(n1*n2)
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums1.endIndex+1), count: nums2.endIndex+1)
        var res = 0
        for row in 1...nums2.endIndex {
            for col in 1...nums1.endIndex {
                if nums1[col-1] == nums2[row-1] {
                    dp[row][col] = dp[row-1][col-1] + 1
                    res = max(res, dp[row][col])
                } else {
                    dp[row][col] = 0
                }
            }
        }
        return res
    }
/*
[1,2,3,2,1,3,2,1,4] n1
[3,2,1,4,7] n2
    123213214
   0000000000 
  30001001000 
  20010200200
  10100030030 
  40000000004
  70000000000

*/