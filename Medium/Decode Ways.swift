/*Decode Ways*/
func numDecodings(_ s: String) -> Int {
    var dp = Array<Int>(repeating: 0, count: s.count + 1)
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
    var dict = Dictionary<String,Int>()
    
    func decode(_ s: String) -> Int {
        if dict[s] != nil {
            return dict[s]!
        }
        let sArr = Array(s)
        if sArr.endIndex == 0 {return 1}
        
        var res = 0
        
        if Int(String(sArr[0]))! > 0 {
            res += decode(String(sArr[1..<sArr.endIndex]))
        } 
        if sArr.endIndex >= 2 {
            if Int(String(sArr[0...1]))! >= 10 && Int(String(sArr[0...1]))! <= 26 {
                res += decode(String(sArr[2..<sArr.endIndex]))
            }    
        }
        
        dict[s] = res
        return res
    }
    
    return decode(s)
}