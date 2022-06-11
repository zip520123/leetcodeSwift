//Minimum Operations to Reduce X to Zero
//O(n^2), O(n), TLE
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var res = Int.max
        func dfs(_ l: Int, _ r: Int, _ step: Int, _ rest: Int) {
            if rest == 0 { 
                res = min(res, step)
            }
            if rest < 0 { return }
            if l > r { return }
            dfs(l+1,r, step+1, rest-nums[l])

            dfs(l,r-1, step+1, rest-nums[r])
            
        }
        dfs(0,nums.endIndex-1, 0, x)
        return res == Int.max ? -1 : res
    }

//O(n), O(n)
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var res = Int.min, dict = [0:-1]
        var target = nums.reduce(0, +) - x
        if target == 0 {return nums.count}
        var sum = 0
        for i in 0..<nums.endIndex {
            sum += nums[i]
            if dict[sum-target] != nil {
                res = max(res, i-dict[sum-target]!)
            }
            dict[sum] = i
        }
        return res == Int.min ? -1 : nums.count-res
    }