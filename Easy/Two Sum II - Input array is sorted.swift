//Two Sum II - Input array is sorted
//O(n), O(n)
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

//O(n), O(1)
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

//O(n log n), O(1)
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        while i < numbers.endIndex-1 {
            var l = i+1, r = numbers.endIndex-1
            while l<r {
                let mid = l+(r-l)>>1
                let curr = numbers[i] + numbers[mid]

                if curr < target {
                    l = mid+1
                } else {
                    r = mid
                }    
            }
            if numbers[i]+numbers[l] == target {
                return [i+1, l+1]
            }
            i += 1
        }
        return []
    }