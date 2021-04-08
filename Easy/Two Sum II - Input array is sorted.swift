//Two Sum II - Input array is sorted
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i,n) in numbers.enumerated() {
            dict[n] = i
        }
        
        for (i,n) in numbers.enumerated() {
            if let index = dict[target - n] {
                return [i+1,index+1]
            }   
        }
        return []
    }

    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        for (i,n) in numbers.enumerated() {
            if let index = dict[target - n] {
                return [index+1, i+1]
            } 
            dict[n] = i
        }
        return []
    }

        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var l = 0, r = nums.endIndex - 1
        while l < r {
            let sum = nums[l] + nums[r]
            if sum < target {
                l+=1
            } else if sum == target {
                return [l+1,r+1]
            } else {
                r-=1
            }
        }
        return []
    }