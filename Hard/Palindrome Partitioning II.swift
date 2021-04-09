// Palindrome Partitioning II
class Solution { // TLE
    func minCut(_ s: String) -> Int {
        if s == "" {return 0}
        var dict = [String:Int]()
        func dfs(_ word: String) -> Int {
            if word == "" {return 0}
            if dict[word] != nil {
                return dict[word]!
            }
            let wArr = Array(word)
            var l = 0, r = 0
            var res = Int.max
            while r < wArr.endIndex {
                if isPalindrome(Array(wArr[l...r])) {
                    res = min(res,dfs(String(wArr[r+1..<wArr.endIndex])) + 1)
                }
                r += 1
            }
            dict[word] = res
            return res
        }
        
        return dfs(s) - 1
    }
    
    
    func isPalindrome(_ sArr:[Character]) -> Bool {
        var l = 0, r = sArr.endIndex - 1
        while l < r {
            if sArr[l] != sArr[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
} 



