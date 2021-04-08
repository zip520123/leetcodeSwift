//Wiggle Subsequence
//O(n^2) O(n)
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        
        var dpUp = [Int](repeating: 1, count : nums.endIndex)
        var dpDown = [Int](repeating: 1, count: nums.endIndex)
        
        for i in 1..<nums.endIndex {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dpUp[i] = max(dpUp[i],dpDown[j] + 1)    
                } else if nums[i] < nums[j] {
                    dpDown[i] = max(dpDown[i],dpUp[j] + 1)
                }
                
            }
        }
        return max(dpUp[nums.endIndex - 1], dpDown[nums.endIndex - 1])
    }

    //O(n) O(n)
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        
        var dpUp = [Int](repeating: 1, count : nums.endIndex)
        var dpDown = [Int](repeating: 1, count: nums.endIndex)
        
        for i in 1..<nums.endIndex {
            if nums[i] == nums[i-1] {
                dpUp[i] = dpUp[i-1]
                dpDown[i] = dpDown[i-1]
            } else if nums[i] < nums[i-1]{
                dpDown[i] = dpUp[i-1] + 1
                dpUp[i] = dpUp[i-1] 
            } else {
                dpUp[i] = dpDown[i-1] + 1
                dpDown[i] = dpDown[i-1]
            }
        }
        return max(dpUp[nums.endIndex - 1], dpDown[nums.endIndex - 1])
    }

    //O(n) O(1)
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        if nums.endIndex < 2 {return nums.endIndex}
        var prevDiff = nums[1] - nums[0]
        var count = prevDiff == 0 ? 1 : 2
        for i in 2..<nums.endIndex {
            let diff = nums[i] - nums[i-1]
            if (diff > 0 && prevDiff <= 0) || (diff < 0 && prevDiff >= 0) {
                count += 1
                prevDiff = diff
            }
            
        }
        return count
    }