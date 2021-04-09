//Palindrome Partitioning
class Solution {
    func partition(_ s: String) -> [[String]] {
        let sArr = Array(s)
        var res = [[String]]()
        func dfs(_ index:Int, _ path:[String]) {
            if index == sArr.endIndex {
                res.append(path)
                return
            }
            for i in index..<sArr.endIndex {
                let curr = Array(sArr[index...i])
                if isPalindrome(curr) {
                    dfs(i+1,path+[String(curr)])
                }
            }
        }
        dfs(0,[])
        return res
    }
    
    func isPalindrome(_ sArr: [Character]) -> Bool {
        var l = 0, r = sArr.endIndex - 1
        while l < r {
            if sArr[l] != sArr[r] {return false}
            l+=1
            r-=1
        }
        return true
    }
}