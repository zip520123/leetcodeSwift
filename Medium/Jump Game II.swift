//Jump Game II
//O(n*m) O(n)
class Solution {
    func jump(_ nums: [Int]) -> Int {
        
        var dp = (0..<nums.endIndex).map {_ in Int.max}
        dp[0] = 0
        for (i, n) in nums.enumerated() {
            var j = i+1
            while j <= i+n && j < nums.endIndex {
                dp[j] = min(dp[j],dp[i]+1)    
                j += 1
            }
        }
        return dp[nums.endIndex-1]
    }
}
//O(n) O(1)
    func jump(_ nums: [Int]) -> Int {
        
        var jumps = 0, farthest = 0, currJump = 0
        
        for i in 0..<nums.endIndex-1 {
            let n = nums[i]
            farthest = max(farthest, i+n)
            if i == currJump {
                jumps += 1
                currJump = farthest
            }
        }
        return jumps
    }