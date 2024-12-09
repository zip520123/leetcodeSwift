// Special Array II
// O(n), O(n)
func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
    var memo = [Int: Int]()
    var l = 0
    var interval_index = 0
    for i in 1..<nums.endIndex {
        let prev = nums[i-1]
        let curr = nums[i]
        if prev % 2 == curr % 2 {
            for j in l..<i {
                memo[j] = interval_index
            }
            interval_index += 1
            l = i
        } 
    }
    for j in l..<nums.endIndex {
        memo[j] = interval_index
    }

    return queries.map { q in memo[q[0]]! == memo[q[1]]! }
}