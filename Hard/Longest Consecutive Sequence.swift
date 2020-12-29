/*Longest Consecutive Sequence*/
//sorted time O(n log n) space O(n)
func longestConsecutive(_ nums: [Int]) -> Int {
    var ncount = nums.count
    if ncount == 0 {
        return 0
    }
    if ncount == 1 {
        return 1
    }
    let nums = Array(Set(nums)).sorted { a, b in
        return a < b
    }
    ncount = nums.count
    var res = 1
    var local = 1
    var p = nums[0]
    for i in 1..<ncount {
        let n = nums[i]
        if n == p + 1 {
            local += 1
            if local > res {
                res = local
            }
        } else {
            local = 1
        }
        p = n
    }
    
    return res
}

//set time O(n) space O(n)
func longestConsecutive(_ nums: [Int]) -> Int {
    var set = Set(nums)
    var res = 0
    for n in set {
        if (set.contains(n - 1) == false) {
            var curr = n
            var count = 1
            while set.contains(curr + 1) {
                curr += 1
                count += 1
            }
            res = max(res, count)
        }
    }
    return res
}