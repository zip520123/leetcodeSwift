/*House Robber II*/
//time O(2n) space O(n)
func rob1(_ nums: [Int]) -> Int {

    var dp1 = Array<Int>(repeating: 0, count: nums.endIndex)
    dp1[0] = nums[0]
    dp1[1] = max(nums[0],nums[1])
    var i = 2
    while i < nums.endIndex {
        let n = nums[i]
        dp1[i] = max(dp1[i-1], n + dp1[i-2])     
        i+=1
    }
    return dp1[nums.endIndex - 1]
}

func rob(_ nums: [Int]) -> Int {
    if nums.endIndex == 1 {
        return nums[0]
    }
    if nums.endIndex == 2 {
        return max(nums[0],nums[1])
    }
    let n1 = rob1(Array(nums[0..<nums.endIndex-1]))
    let n2 = rob1(Array(nums[1..<nums.endIndex]))
    
    return max(n1,n2)
    
}

//time O(2n) space O(1)
    func rob1(_ nums: [Int]) -> Int {
        var dp1 = nums[0]
        var dp2 = max(nums[0],nums[1])
        var i = 2
        while i < nums.endIndex {
            let n = nums[i]
            let curr = max(dp2,dp1 + n)
            dp1 = dp2
            dp2 = curr
            i+=1
        }
        return dp2
    }