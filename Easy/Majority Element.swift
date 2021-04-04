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