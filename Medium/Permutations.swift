/*Permutations
Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]*/
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        func dfs(_ arr: [Int], _ curr: [Int]) {
            if (arr.count == 0) {
                result.append(curr)
                return
            }
            var i = 0
            var cArr = arr
            var cCurr = curr
            while(i<cArr.count) {
                let n = cArr.remove(at: i)
                cCurr.append(n)
                dfs(cArr,cCurr)
                cCurr.removeLast()
                cArr.insert(n, at:i)
                i+=1
            }
        }
        dfs(nums,[])
        return result
    }
}