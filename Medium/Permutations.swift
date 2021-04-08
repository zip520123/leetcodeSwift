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
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ restNums: [Int], _ path: [Int]) {
            var restNums = restNums
            if restNums.endIndex == 0 {
                res.append(path)
                return 
            }
            
            var i = 0 
            while i < restNums.endIndex {
                let n = restNums[i]
                restNums.remove(at:i)
                dfs(restNums, path+[n])
                restNums.insert(n, at:i)
                i += 1
            }
        }
        dfs(nums,[])
        return res
    }