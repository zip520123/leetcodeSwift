/*Longest Increasing Subsequence*/
//time O(n^2) space O(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = Array<Int>(repeating:1, count: nums.endIndex)
    var max = 1
    var i = 1
    while i < nums.endIndex {
        let n = nums[i]
        var j = 0
        while j < i {
            let n2 = nums[j]
            if n2 < n {
                dp[i] = Swift.max(dp[i], dp[j] + 1)
                max = Swift.max(max, dp[i])
            }
            j += 1
        }
        i += 1
    }
    return max
}

//time O(n log n) space O(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = [Int]()
    for n in nums {
        var left = 0, right = dp.endIndex
        while left < right {
            let mid = left + (right - left) >> 1
            if dp[mid] < n {
                left = mid + 1
            } else {
                right = mid
            }
        }
        if left == dp.endIndex {
            dp.append(n)
        } else {
            dp[left] = n
        }
        
    }
    return dp.endIndex
}
//time O(n^2) space O(n)
func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = [Int](repeating: 1, count: nums.endIndex)
    var res = 1
    for i in 0..<nums.endIndex {
        for j in 0..<i {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j] + 1)
                res = max(res, dp[i])
            }
        }
    }
    
    return res
}