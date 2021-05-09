//Maximum Average Subarray I
//O(n) O(1)
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var res = Int.min, sum = 0
        for i in 0..<nums.endIndex{
            let n = nums[i]
            sum += n
            if i>=k-1 {
                res = max(res, sum)
                sum -= nums[i-k+1]
            }
        }
        return Double(res)/Double(k)
    }