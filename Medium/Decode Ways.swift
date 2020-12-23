/*Decode Ways*/
func numDecodings(_ s: String) -> Int {
    let sArr = Array(s)
    let scount = s.count
    var dp = Array<Int>(repeating: 0, count: scount + 1)
    dp[0] = 1
    if Int(String(sArr[0]))! != 0 {
        dp[1] = 1
    }
    if scount < 2 {
        return dp[scount]
    }
    for i in 2...scount {
        if let one = Int(String(sArr[i-1])) {
            if one >= 1 {
                dp[i] += dp[i-1]
            }
        }
        if let two = Int(String(sArr[i-2..<i])) {
            if two <= 26 && two >= 10 {
                dp[i] += dp[i-2]
            }
        }
        
    }
    return dp[scount]
}