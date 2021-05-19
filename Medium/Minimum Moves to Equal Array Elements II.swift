//Minimum Moves to Equal Array Elements II
//O(n log n), O(1)
    func minMoves2(_ nums: [Int]) -> Int {
        var res = 0
        let arr = nums.sorted()
        var l = 0, r = nums.endIndex - 1
        while l<r {
            res += arr[r] - arr[l]
            l += 1
            r -= 1
        }
        return res
    }