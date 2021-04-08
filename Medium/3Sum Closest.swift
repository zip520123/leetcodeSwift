//3Sum Closest
//O(n^2)
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted(by: <)
        var i = 0, diff = Int.max
        
        while i < nums.endIndex - 2 {
            var l = i + 1, r = nums.endIndex - 1
            let a = nums[i]
            while l < r {
                let b = nums[l], c = nums[r]
                let sum = a + b + c
                
                if abs(target - sum) < abs(diff) {
                    diff = target - sum
                }
                
                
                if sum < target {
                    l += 1
                } else {
                    r -= 1
                }
            }
            
            i += 1
        }
        return target - diff
    }

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        var i = 0, diff = Int.max //diff = sum - target
        while i < nums.endIndex - 2 {
            var l = i + 1, r = nums.endIndex - 1
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                if abs(sum - target) < abs(diff) {
                    diff = sum - target
                }
                if sum < target {
                    l += 1
                } else {
                    r -= 1
                }
                
            }
            i+=1
        }
        
        return target + diff //  target + sum - target
    }