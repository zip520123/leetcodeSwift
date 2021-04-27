//Regular Expression Matching
//O(s*p) O(s*p)
func isMatch(_ s: String, _ p: String) -> Bool {
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: p.count+1), count: s.count+1)
    dp[0][0] = true
    let sArr = Array(s), pArr = Array(p)
    let cols = p.count, rows = s.count
    var i = 1
    while i <= cols {
        if pArr[i-1] == "*" {
            dp[0][i] = dp[0][i-2]
        } else {
            dp[0][i] = false    
        }
        i += 1
    } 
    i = 1
    while i <= rows {
        let char = sArr[i-1]
        var j = 1
        while j <= cols {
            let patten = pArr[j-1]
            if char == patten || patten == "." {
                dp[i][j] = dp[i-1][j-1]
            } else if patten == "*" {
                dp[i][j] = dp[i][j-2]
                if pArr[j-2] == "." || pArr[j-2] == char {
                    dp[i][j] = dp[i][j] || dp[i-1][j]    
                }
                
            }
            j += 1
        }
        i += 1
    }
    return dp[rows][cols]
    
}