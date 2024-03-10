// Intersection of Two Arrays
// O(n), O(n)
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var set1 = Set(nums1)
    var set2 = Set(nums2)
    var res = [Int]()
    for n in set2 {
        if set1.contains(n) {
            res.append(n)
        }
    }
    return res
}