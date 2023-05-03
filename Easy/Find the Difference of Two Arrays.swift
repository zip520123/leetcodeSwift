//Find the Difference of Two Arrays
//O(n), O(n)
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let set1 = Set(nums1)
        var res1 = Set<Int>()
        for n in nums2 {
            if set1.contains(n) == false {
                res1.insert(n)
            }
        }
        let set2 = Set(nums2)
        var res2 = Set<Int>()
        for n in nums1 {
            if set2.contains(n) == false {
                res2.insert(n)
            }
        }
        return [Array(res2),Array(res1)]
    }