//Find the Duplicate Number
//O(n) O(n)
func findDuplicate(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for n in nums {
        if set.contains(n) {
            return n
        }
        set.insert(n)
    }
    return 0
}