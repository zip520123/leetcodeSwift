// Maximum Size of a Set After Removals
// O(n), O(n)
func maximumSetSize(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let n = nums1.endIndex, s1 = Set(nums1), s2 = Set(nums2)
    let n1 = s1.count, n2 = s2.count
    var c = 0
    for num in s1 {
        if s2.contains(num){
            c += 1
        }
    }
    return min(n, min(n1-c, n/2)+min(n2-c, n/2)+c)
}