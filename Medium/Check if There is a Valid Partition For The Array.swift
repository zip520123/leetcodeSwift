// Check if There is a Valid Partition For The Array
// O(n), O(n)
func validPartition(_ nums: [Int]) -> Bool {
    var dict = [Int: Bool]()
    func dfs(_ i: Int) -> Bool {
        if dict[i] != nil {return dict[i]!}
        if i == nums.endIndex {return true} 
        var res = false
        if i+1 < nums.endIndex && nums[i] == nums[i+1] {
            res = res || dfs(i+2)
        }
        if i+2 < nums.endIndex && nums[i] == nums[i+1] && nums[i+1] == nums[i+2] {
            res = res || dfs(i+3)
        }
        if i+2 < nums.endIndex && nums[i] == nums[i+1]-1 && nums[i+1] == nums[i+2]-1 {
            res = res || dfs(i+3)
        }
        dict[i] = res
        return res
    }

    return dfs(0)
}