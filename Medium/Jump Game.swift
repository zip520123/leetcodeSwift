/*Jump Game*/
//time O(n^2) space O(1)
func canJump(_ nums: [Int]) -> Bool {
    let ncount = nums.count
    var dp = Array(repeating: false, count: ncount)
    dp[0] = true
    for (i,n) in nums.enumerated() {
        guard dp[i] == true && n > 0 else {continue}
        for j in i+1...i+n {
            if j < ncount {
                dp[j] = true
            }
        }
    }
    return dp[ncount - 1]
}
//time O(n) space O(1)
func canJump(_ nums: [Int]) -> Bool {
    let ncount = nums.count
    var pos = ncount - 1
    for i in (0..<ncount).reversed() {
        let n = nums[i]
        if i + n >= pos {
            pos = i
        }
    }
    return pos == 0
}

//time O(n) space O(1)
func canJump(_ nums: [Int]) -> Bool {
    var maxReach = 0
    for i in 0..<nums.count - 1 {
        if maxReach < nums[i] + i {
            maxReach = nums[i] + i
        }
        
        if nums[i] == 0 && maxReach == i {
            return false;
        }
    }

    return true        
}

//O(n), O(1)
func canJump(_ nums: [Int]) -> Bool {
    var p = nums.endIndex-1
    for i in (0..<nums.endIndex-1).reversed() {
        if nums[i] + i >= p {
            p = i
        }     
    }
    return p == 0
}