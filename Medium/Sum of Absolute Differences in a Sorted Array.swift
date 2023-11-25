// Sum of Absolute Differences in a Sorted Array
// O(n), O(1)
func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    var rsum = nums.reduce(0, +)
    var lsum = 0
    let n = nums.endIndex
    for i in 0..<n {
        let curr = nums[i]
        res.append(rsum - (n - i) * curr + curr * i - lsum)
        lsum += curr
        rsum -= curr
    }
    return res
}