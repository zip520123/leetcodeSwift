// Largest Positive Integer That Exists With Its Negative
// O(n log n), O(n)
func findMaxK(_ nums: [Int]) -> Int {
    let arr = nums.sorted()
    var set = Set<Int>()
    for n in nums {
        if n > 0 {
            set.insert(n)
        }
    }
    for n in arr {
        if set.contains(-n) {
            return -n
        }
    }
    return -1
}