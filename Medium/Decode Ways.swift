/*Decode Ways*/
func numDecodings(_ s: String) -> Int {
    var dp = (0...s.count).map {_ in 0 }
    dp[0] = 1
    let sArr = Array(s)
    
    for i in 1...sArr.endIndex {
        if Int(String(sArr[i - 1]))! > 0 {
            dp[i] += dp[i - 1]
        }
        if i >= 2 {
            let two = Int(String(sArr[i-2...i-1]))!
            if two >= 10 && two <= 26 {
                dp[i] += dp[i - 2]
            }    
        }
    }
    return dp[sArr.endIndex]
}

//time O(n) space O(n)
func numDecodings(_ s: String) -> Int {
    
    var dict = [String: Int]()
    func decode(_ s: String) -> Int {
        if s == "" {return 1}
        if dict[s] != nil {return dict[s]!}
        let sArr = Array(s)
        
        var res = 0
        var i = 0
        let one = Int(String(sArr[i]))!
        if one > 0 {
            res += decode(String(sArr[(i+1)...]))
        }
        if i+1 < sArr.endIndex {
            let two = Int(String(sArr[i...(i+1)]))!
            if two >= 10 && two <= 26 {
                res += decode(String(sArr[(i+2)...]))
            }
        }
        dict[s] = res
        return res
    }
    
    return decode(s)
}

//O(n), O(1)
    func numDecodings(_ s: String) -> Int {
        var one_back = 1, two_back = 1
        let sArr = Array(s)
        if sArr[0] == "0" {return 0}
        for i in 1...sArr.endIndex {
            let one = Int(String(sArr[i-1]))!
            var n = 0
            if one > 0 {
                n += one_back
            }
            if i >= 2 {
                let two = Int(String(sArr[i-2...i-1]))!
                if two >= 10 && two <= 26 {
                    n += two_back
                }
            }
            two_back = one_back
            one_back = n
        }
        return one_back
    }

    func numDecodings(_ s: String) -> Int {
        var dp1 = 1, dp2 = 1
        let sArr = Array(s)
        if sArr[0] == "0" {return 0}
        for i in 1...sArr.endIndex {
            let one = Int(String(sArr[i-1]))!
            var n = 0
            if one > 0 {
                n += dp1
            }
            if i >= 2 {
                let two = Int(String(sArr[i-2...i-1]))!
                if two >= 10 && two <= 26 {
                    n += dp2
                }
            }
            dp2 = dp1
            dp1 = n
        }
        return dp1
    }