//Largest Divisible Subset
//O(n^2), O(n)
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()  //O(n log n)
        var dp = nums.map{_ in (count:1, prev:-1)} //O(n) space
        var resCount = 1, resIndex = 0
        for i in 1..<nums.endIndex { //O(n^2)
            for j in 0..<i {
                if nums[i] % nums[j] == 0 {
                    if dp[j].count + 1 > dp[i].count {
                        dp[i] = (dp[j].count + 1, j)
                        if dp[i].count > resCount {
                            resCount = dp[i].count    
                            resIndex = i
                        }
                    }
                }
            }
        }
        var res = [Int]()
        while resIndex != -1 { //O(n)
            res.append(nums[resIndex])
            resIndex = dp[resIndex].prev
        }
        return res    
    }

// O(n^2), O(n^2)
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let arr = nums.sorted()
        var dp: [[Int]] = arr.map { n in [n] }
        for i in 1..<arr.endIndex {
            for j in 0..<i {
                if arr[i] % arr[j] == 0 && dp[i].endIndex < dp[j].endIndex + 1 {
                    dp[i] = dp[j] + [arr[i]]
                }
            }
        }
        var res = [Int]()
        for item in dp {
            if item.endIndex > res.endIndex {
                res = item
            }
        }
        return res
    }