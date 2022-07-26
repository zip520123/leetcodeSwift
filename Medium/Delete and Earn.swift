// Delete and Earn
//O(n), O(1)
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default: 0] += 1
        }
        
        var dp = (0...10000).map { _ in 0 }
        dp[1] = dict[1, default:0]
        dp[2] = dict[2, default: 0] * 2
        for i in 3...10000 {
            dp[i] = max(dp[i-2], dp[i-3]) + dict[i, default:0] * i
        }
        return max(dp[10000], dp[9999])
    }

//O(n), O(1)
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default: 0] += n
        }
        var take = 0, skip = 0
        for n in 0...10000 {
            let value = dict[n, default: 0]
            let temp = max(skip+value, take)
            skip = take
            take = temp
        }
        return take
    }