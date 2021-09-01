//Array Nesting
//O(n), O(n)
class Solution {
    var dict = [Int: Int]()
    func arrayNesting(_ nums: [Int]) -> Int {
        
        var res = 0
        for i in 0..<nums.endIndex {
            let n = nums[i]
            if dict[n] == nil {
                dict[n] = 0
                let next = nums[n]
                let curr = dfs(nums, next)
                dict[n] = curr + 1
                res = max(res, dict[n]!)
            }

        }
        return res
    }
    
    func dfs(_ arr: [Int], _ n: Int) -> Int {
        if dict[n] != nil {
            return dict[n]!
        }
        dict[n] = dfs(arr, arr[n]) + 1
        return dict[n]!
    }
}