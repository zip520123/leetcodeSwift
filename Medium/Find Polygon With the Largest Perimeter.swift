// Find Polygon With the Largest Perimeter
// O(n log n), O(n)
    func largestPerimeter(_ nums: [Int]) -> Int {
        var res = -1
        let arr = nums.sorted()
        var curr = arr[0] + arr[1]
        for i in 2..<arr.endIndex {
            if curr > arr[i] {
                res = max(res, curr+arr[i])
            }
            curr += arr[i]
        }
        return res
    }