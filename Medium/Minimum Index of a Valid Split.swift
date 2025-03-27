// Minimum Index of a Valid Split
// O(n), O(n)
func minimumIndex(_ nums: [Int]) -> Int {
    var dict_left = [Int: Int]()
    var dict_right = [Int: Int]()

    for n in nums {
        dict_right[n, default: 0] += 1
    }

    for i in 0..<nums.endIndex {
        let curr = nums[i]
        dict_left[curr, default: 0] += 1
        dict_right[curr, default: 0] -= 1
        if dict_left[curr]! * 2 > i+1 && dict_right[curr]! * 2 > nums.endIndex-i-1 {
            return i
        }
    }
    return -1
}