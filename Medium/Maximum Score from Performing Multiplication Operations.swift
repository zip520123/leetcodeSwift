//Maximum Score from Performing Multiplication Operations
//O(2^multipliers.len), O(multipliers.len), TLE
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        var dict = [[Int]: Int]()
        func dfs(_ l: Int, _ r: Int, _ i: Int) -> Int {
            if i == multipliers.endIndex else {return 0}
            if dict[[l,r,i]] != nil {return dict[[l,r,i]]! }
            if l==r {return nums[l]*multipliers[i]}
            let left = nums[l] * multipliers[i] + dfs(l+1, r, i+1)
            let right = nums[r] * multipliers[i] + dfs(l, r-1, i+1)
            let curr = max(left, right)
            dict[[l,r,i]] = curr
            return curr
        }
        return dfs(0, nums.endIndex-1, 0)
    }

    