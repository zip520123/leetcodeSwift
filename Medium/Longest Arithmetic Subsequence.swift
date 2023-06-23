// Longest Arithmetic Subsequence
// O(n^2),O(n^2)
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        var dict = [[Int]: Int]()
        for i in 0..<nums.endIndex {
            for j in 0..<i {
                dict[[i,nums[i]-nums[j]]] = dict[[j, nums[i]-nums[j]], default: 1] + 1
            }

        }
        return dict.values.reduce(0, { max($0, $1) })
    }