//Non-decreasing Array
//O(n) O(1)
    func checkPossibility(_ nums: [Int]) -> Bool {
        
        var nums = nums
        for i in 0..<nums.endIndex-1 {
            if nums[i] > nums[i+1] {
                let temp = nums[i]
                nums[i] = nums[i+1]
                var case1 = true
                for i in 0..<nums.endIndex-1 {
                    if nums[i] > nums[i+1] {
                        case1 = false
                    }
                }
                nums[i] = temp
                nums[i+1] = nums[i]
                var case2 = true
                for i in 0..<nums.endIndex-1 {
                    if nums[i] > nums[i+1] {
                        case2 = false
                    }
                }
                if case1 == true || case2 == true {
                    return true
                } else {
                    return false
                }
            }
        }
        return true
    }
//O(n) O(1)
    func checkPossibility(_ nums: [Int]) -> Bool {
        var nums = nums
        var count = 0
        for i in 0..<nums.endIndex-1 {
            if nums[i] > nums[i+1] {
                if count == 1 {
                    return false
                }
                count += 1
                if i > 0 && nums[i-1] > nums[i+1] {
                    nums[i+1] = nums[i]
                } else {
                    nums[i] = nums[i+1]
                }
            }
        }
        return true
    }
/*
[3,4,2,3]

[3,4,4,3]
[3,2,2,3]
 4>2

[5,7,1,8]
[5,7,7,8]
[5,1,1,8]
 7>1
[4,2,3]
[4,4,3]
[2,2,3]
*/