//Jump Game VI
//O(n*k), O(n), TLE
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        var dp = (0..<nums.endIndex).map {_ in 0}
        dp[0] = nums[0]
        for i in 1..<nums.endIndex {
            var curr = nums[i]
            var prev = Int.min
            for j in i-k..<i {
                if j >= 0 {
                    prev = max(prev, dp[j])
                }
            }
            dp[i] = curr + prev
        }
        return dp.last!
    }

//O(n), O(n+k)
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        var dp = (0..<nums.endIndex).map {_ in 0}
        var queue = [0]
        dp[0] = nums[0]
        for i in 1..<nums.endIndex {
            let n = nums[i]
            let curr = dp[queue.first!] + n
            dp[i] = curr
            while !queue.isEmpty && dp[queue.last!] < curr {
                queue.removeLast()
            }
            queue.append(i)
            if queue.first! == i-k {
                queue.removeFirst()
            }
        }
        return dp.last!
    }