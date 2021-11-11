//Minimum Value to Get Positive Step by Step Sum
//O(n^2*m),O(1) n = nums.count, m = res
    func minStartValue(_ nums: [Int]) -> Int {
        var i = 1
        
        next: while true {
            var sum = i
            for n in nums {
                sum += n
                if sum < 1 {
                    i += 1
                    continue next
                }
            }
            return i
        }
    }

//O(n log mn), O(1), n = nums.count, m = res
    func minStartValue(_ nums: [Int]) -> Int {
        var l = 1, r = nums.endIndex * 100
        while l<r {
            let mid = l+(r-l)>>1
            var sum = mid
            var isValid = true
            
            for n in nums {
                sum += n
                if sum < 1 {
                    isValid = false
                    break
                }
            }
            if isValid {
                r = mid
            } else {
                l = mid+1
            }
        }
        return l
    }