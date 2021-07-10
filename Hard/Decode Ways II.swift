//Decode Ways II
//O(n), O(n)
    func numDecodings(_ s: String) -> Int {
        var dp = (0...s.count).map { _ in 0 }
        let m = Int(1E9+7)
        let sArr = Array(s)
        dp[0] = 1
        dp[1] = sArr[0] == "*" ? 9 : sArr[0] == "0" ? 0 : 1
        for i in 1..<sArr.endIndex {
            if sArr[i] == "*" {
                dp[i+1] = 9 * dp[i] % m 
                if sArr[i-1] == "1" {
                    dp[i+1] = (dp[i+1] + 9 * dp[i-1]) % m
                } else if sArr[i-1] == "2" {
                    dp[i+1] = (dp[i+1] + 6*dp[i-1]) % m
                } else if sArr[i-1] == "*" {
                    dp[i+1] = (dp[i+1]+15 * dp[i-1]) % m
                }
            } else {
                dp[i+1] = sArr[i] != "0" ? dp[i] : 0
                if sArr[i-1] == "1" {
                    dp[i+1] = (dp[i+1]+dp[i-1]) % m
                } else if sArr[i-1] == "2" && sArr[i] <= "6" {
                    dp[i+1] = (dp[i+1]+dp[i-1]) % m
                } else if sArr[i-1] == "*" {
                    dp[i+1] = (dp[i+1] + (sArr[i] <= "6" ? 2 : 1)*dp[i-1]) % m
                }
            }
        }
        return dp[s.count]
    }