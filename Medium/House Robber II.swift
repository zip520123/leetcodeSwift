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
            let n = max(dp2, dp1+nums[i])
            dp1 = dp2
            dp2 = n
            i += 1
        }
        return dp2
    }

//O(n), O(n)
    class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.endIndex == 0 {return 0}
        if nums.endIndex == 1 {return nums[0]}
        return max(rob2(Array(nums[0..<nums.endIndex-1])), rob2(Array(nums[1...])))
    }
    func rob2(_ nums: [Int]) -> Int {
        if nums.endIndex == 0 {return 0}
        if nums.endIndex == 1 {return nums[0]}
        var arr = [Int]()
        arr.append(nums[0])
        arr.append(max(nums[0],nums[1]))
        var i = 2 
        while i < nums.endIndex {
            arr.append(max(arr[i-1], arr[i-2] + nums[i]))
            i += 1
        }
        return arr.last!
    }
}