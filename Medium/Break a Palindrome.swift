//Break a Palindrome
//O(n), O(n)
    func breakPalindrome(_ p: String) -> String {
        if p.count == 1 {return ""}
        var arr = Array(p)
        for i in 0..<arr.endIndex/2 {
            if arr[i] != "a" {
                arr[i] = "a"
                return String(arr)
            }
        }
        arr[arr.endIndex-1] = "b"
        return String(arr)
    }

//O(n^24 log n^24), O(n^24) TLE
class Solution {
    func breakPalindrome(_ palindrome: String) -> String {
        if isPalindrome(palindrome) == false {return palindrome}
        let arr = Array(palindrome)
        var strs = [String]()
        for i in 0..<arr.endIndex {
            for char in "abcdefghijklmnopqrstuvwxyz" {
                let newWord = String(arr[0..<i]) + String(char) + String(arr[(i+1)...])
                if isPalindrome(newWord) == false {
                    strs.append(newWord)
                }
            }
        }
        if strs.isEmpty {return ""}
        
        return strs.sorted().first!
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let arr = Array(s)
        var l = 0, r = arr.endIndex-1
        while l<r {
            if arr[l] != arr[r] {return false}
            l+=1
            r-=1
        }
        return true
    }
}