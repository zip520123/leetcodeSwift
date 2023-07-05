// Longest Subarray of 1's After Deleting One Element
// O(n), O(1)
    func longestSubarray(_ nums: [Int]) -> Int {
        var count = 0
        for n in nums {
            if n == 0 { count += 1}
        }
        let n = nums.endIndex
        if count == 0 || count == 1{
            return n-1
        }
        var l=0,r=0
        var zero = 0
        var res = 0
        while r<n {
            if nums[r] == 0 {
                zero += 1
                while zero > 1 {
                    if nums[l] == 0 {
                        zero -= 1
                    }
                    l += 1
                }
            }
            res = max(res, r-l+1)
            r += 1
        }
        return res-1
    }