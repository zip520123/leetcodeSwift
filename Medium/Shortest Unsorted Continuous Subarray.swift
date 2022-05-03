// Shortest Unsorted Continuous Subarray
//O(n log n), O(n)
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let arr = nums.sorted()
        var start = nums.endIndex, end = 0
        for i in 0..<arr.endIndex {
            if arr[i] != nums[i] {
                start = min(start, i)
                end = max(end, i)
            }
        }
        return end-start >= 0 ? end-start+1 : 0
    }