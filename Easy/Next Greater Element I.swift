//Next Greater Element I
//O(nums1 * nums2), O(nums2)
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for (i,n) in nums2.enumerated() {
            dict[n] = i
        } 
        var res = [Int]()
        for n in nums1 {
            var i = dict[n]!
            var curr = -1
            while i < nums2.endIndex {
                if nums2[i] > n {
                    curr = nums2[i]
                    break
                }
                i += 1
            }
            res.append(curr)
        }
        return res
    }