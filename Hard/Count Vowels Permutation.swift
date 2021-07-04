//Count Vowels Permutation
//O(n), O(n)
/*
a - e
e - a, i
i - a, e, o, u
o - i, u
u - a

dp[0][a] = 1
dp[0][e] = 1
dp[0][i] = 1
dp[0][o] = 1
dp[0][u] = 1

dp[1][a] = dp[0][i] + dp[0][u] + dp[0][e] = 3, ia, ua, ea
dp[1][e] = dp[0][a] + dp[0][i] = 2, ae, ie
dp[1][i] = dp[0][e] + dp[0][o] = 2, ei, oi
dp[1][o] = dp[0][i] = 1, io
dp[1][u] = dp[0][i] + dp[0][o] = 2, iu, ou

res = dp[n-1][a] + dp[n-1][e] + dp[n-1][i] + dp[n-1][o] + dp[n-1][u]
*/
class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        var dp = (0..<n).map{_ in (0..<5).map{_ in 0 } }
        let mod = Int(1E9+7)
        for i in 0..<5 {
            dp[0][i] = 1    
        }
        for i in 1..<n {
            dp[i][0] = (dp[i-1][1] + dp[i-1][2] + dp[i-1][4]) % mod
            dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % mod
            dp[i][2] = (dp[i-1][1] + dp[i-1][3]) % mod
            dp[i][3] = dp[i-1][2]
            dp[i][4] = (dp[i-1][2] + dp[i-1][3]) % mod
        }
        var res = 0
        for i in 0..<5 {
            res += dp[n-1][i] 
        }
        return res % mod
        // return (0..<5).reduce(0) { ($0 + dp[n-1][$1]) % mod }
    }
}

//O(1) space
    func countVowelPermutation(_ n: Int) -> Int {
        var a = 1, e = 1, i = 1, o = 1, u = 1
        let mod = Int(1E9+7)
       
        for _ in 1..<n {
            let newA = (i + u + e) % mod
            let newE = (a + i) % mod
            let newI = (e + o) % mod
            let newO = i
            let newU = (i + o) % mod
            a = newA
            e = newE
            i = newI
            o = newO
            u = newU
        }
        
        return (a+e+i+o+u) % mod
    }