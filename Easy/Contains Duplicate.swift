/*Contains Duplicate*/
//time O(n) space O(n)
func containsDuplicate(_ nums: [Int]) -> Bool {
    var set = Set<Int>()
    for n in nums {
        if set.contains(n) {
            return true
        }
        set.insert(n)
    }
    return false
}