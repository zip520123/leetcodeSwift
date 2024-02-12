/*Majority Element*/
//time O(n) space O(1)
func majorityElement(_ nums: [Int]) -> Int {
    var count = 1
    var candidate = nums[0]
    for i in 1..<nums.endIndex {
        let n = nums[i]
        if n != candidate {
            count -= 1
            if count == 0 {
                candidate = n  
                count = 1
            }
            
        } else {
            count += 1
        }
    }
    return candidate
}

// O(n), O(1)
func majorityElement(_ nums: [Int]) -> Int {
    var res = 0, count = 0
    for n in nums {
        if res == n {
            count += 1
        } else {
            if count == 0 {
                res = n
                count = 1
            } else {
                count -= 1
            }
        }
    }
    return res
}