// Count Complete Subarrays in an Array
// O(n), O(n)
func countCompleteSubarrays(_ nums: [Int]) -> Int {
    var elements = 0, l = 0, r = 0
    let n = nums.endIndex
    var nums_set = Set<Int>()
    for n in nums {
        nums_set.insert(n)
    }
    let distinct = nums_set.count
    var memo = [Int: Int]()
    var res = 0
    
    while r < n {
        let num = nums[r]
        memo[num, default: 0] += 1
        if memo[num]! == 1 {
            elements += 1
            while elements == distinct {
                res += n-r
                let left_num = nums[l]
                memo[left_num]! -= 1
                if memo[left_num]! == 0 {
                    elements -= 1
                }
                l += 1
            }
        }
        r += 1
    }
    return res
}