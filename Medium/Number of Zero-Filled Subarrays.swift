//Number of Zero-Filled Subarrays
//O(n), O(1)
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var res = 0, count = 0
        for n in nums {
            if n != 0 {
                res += (count+1)*count/2
                count = 0
            } else {
                count += 1
            }
        }
        res += (count+1)*count/2
        return res
    }

//O(n), O(1)
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var res = 0, count = 0
        for n in nums {
            if n == 0 {
                count += 1
            } else {
                count = 0
            }
            res += count
        }
        return res
    }