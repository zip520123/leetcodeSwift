//Binary Trees With Factors
//O(n^2), O(n)
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let mod = Int(1E9+7)
        let n = arr.endIndex
        let arr = arr.sorted()
        var dp = [Int](repeating: 1, count: n)
        var dict = [Int: Int]()
        for i in 0..<n {
            dict[arr[i]] = i
        }
        for i in 0..<n {
            for j in 0..<i {
                if arr[i] % arr[j] == 0 {
                    if let node = dict[arr[i] / arr[j]] {
                        dp[i] = (dp[i] + dp[j] * dp[node]) % mod
                    }
                }
            }
        }
        return dp.reduce(0, +) % mod
    }