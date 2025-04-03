// Maximum Value of an Ordered Triplet I
// O(n^3), O(1)
func maximumTripletValue(_ nums: [Int]) -> Int {
    var res = 0
    let n = nums.endIndex
    for i in 0..<n-2 {
        for j in i+1..<n-1 {
            for k in j+1..<n {
                res = max(res, (nums[i]-nums[j]) * nums[k])
            }
        }
    }
    return res
}