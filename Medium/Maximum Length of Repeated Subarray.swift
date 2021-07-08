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