// Minimize Maximum Pair Sum in Array
// O(n log n), O(n)
    func minPairSum(_ nums: [Int]) -> Int {
        let n = nums.endIndex
        let arr = nums.sorted()
        var res = 0
        for i in 0..<n/2 {
            let curr = arr[i] + arr[n-i-1]
            if curr > res {
                res = curr
            }
        }
        return res
    }