/*Minimum Size Subarray Sum*/
//brute force time O(n^2) space O(1)
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var res = Int.max
    for i in 0..<nums.endIndex {
        var sum = 0
        for j in i..<nums.endIndex {
            sum += nums[j]
            if sum >= target {
                res = min(res,j-i+1)
                break
            }
        }
    }
    return res == Int.max ? 0 : res
}

//2 pointer time O(n) space O(1)
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var l = 0, r = 0
    var res = Int.max
    var sum = 0
    while r < nums.endIndex {
        sum += nums[r]
        while sum >= target {
            res = min(res,r-l+1)
            sum -= nums[l]
            l+=1
        }
        r+=1
    }
    return res == Int.max ? 0 : res
}