//Path Sum IV
//O(n) O(h)
    func pathSum(_ nums: [Int]) -> Int {
        var dict = [Int:Int]()
        for n in nums {
            let levelPos = n / 10, val = n % 10
            dict[levelPos] = val
        }
        var res = 0
        func dfs(_ node:Int, _ sum: Int) {
            let currSum = node % 10 + sum
            let level = node/100
            let pos = node%100 / 10
            let leftLevelPos = (level+1)*10 + pos*2 - 1
            let rightLevelPos = (level+1)*10 + pos*2
            if dict[leftLevelPos] == nil && dict[rightLevelPos] == nil {
                res += currSum
            }
            if let leftVal = dict[leftLevelPos] {
                dfs(leftLevelPos*10+leftVal, currSum)
            }
            if let rightVal = dict[rightLevelPos] {
                dfs(rightLevelPos*10+rightVal, currSum)
            }
        } 
        dfs(nums[0], 0)
        return res
    }