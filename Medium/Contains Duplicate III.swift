/*Contains Duplicate III*/
//O(n^2) O(1)
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if k == 0 || nums.endIndex <= 1 {return false}
        for i in 0..<nums.endIndex - 1 {
            for j in i+1..<nums.endIndex {
                if abs(nums[i] - nums[j]) <= t && abs(i - j) <= k {
                    return true
                } 
            }
        }
        return false
    }

//     The idea is like the bucket sort algorithm. Suppose we have consecutive buckets covering the range of nums with each bucket a width of (t+1). If there are two item with difference <= t, one of the two will happen:

// (1) the two in the same bucket
// (2) the two in neighbor buckets
// def containsNearbyAlmostDuplicate(self, nums, k, t):
//     if t < 0: return False
//     n = len(nums)
//     d = {}
//     w = t + 1
//     for i in xrange(n):
//         m = nums[i] / w
//         if m in d:
//             return True
//         if m - 1 in d and abs(nums[i] - d[m - 1]) < w:
//             return True
//         if m + 1 in d and abs(nums[i] - d[m + 1]) < w:
//             return True
//         d[m] = nums[i]
//         if i >= k: del d[nums[i - k] / w]
//     return False

// func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
//         var dict = [Int:Int]()
//         let w = t + 1
//         for i in 0..<nums.endIndex {
//             let m = nums[i] / w
//             if dict[m] != nil {
//                 return true
//             } 
//             if dict[m-1] != nil && abs(nums[i] - dict[m-1]!) < w {
//                 return true
//             }
//             if dict[m+1] != nil && abs(nums[i] - dict[m+1]!) < w {
//                 return true
//             }
//             dict[m] = nums[i]
//             if i >= k {
//                 dict[nums[i-k] / w] = nil
//             }
//         }
//         return false
//     }