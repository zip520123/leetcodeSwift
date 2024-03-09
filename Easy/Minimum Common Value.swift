// Minimum Common Value
// O(n), O(n)
func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var set = Set(nums1)
    var res = Int.max
    for n in nums2 {
        if set.contains(n), n < res {
            res = n
        }
    }    
    if res == Int.max {
        return -1
    }
    return res
}