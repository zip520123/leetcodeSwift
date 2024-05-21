// Sum of All Subset XOR Totals
// O(2^n), O(2^n)
func subsetXORSum(_ nums: [Int]) -> Int {
    var res = 0
    func dfs(_ path: Int, _ index: Int) {
        if index == nums.endIndex {
            res += path
            return
        }
        dfs(path ^ nums[index], index+1)
        dfs(path, index+1)
    }
    dfs(0,0)
    return res
}