//Restore The Array
//O(s.length * log k), O(s.length)
    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        let arr = Array(s)
        var dp = [Int](repeating: 0, count: arr.endIndex+1)
        let mod = Int(1E9) + 7
        func dfs(_ index: Int) -> Int {
            if dp[index] != 0 {
                return dp[index]
            }
            if index == arr.endIndex { return 1 }
            if arr[index] == "0" { return 0 }
            var count = 0
            for i in index..<arr.endIndex {
                let currString = String(arr[index...i])

                if let currN = Int(currString), currN > k {
                    break
                }
                count += dfs(i+1)
            }
            dp[index] = count % mod
            return count
        }
        return dfs(0) % mod
    }