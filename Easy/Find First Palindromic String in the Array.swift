// Find First Palindromic String in the Array
// O(n), O(n)
    func firstPalindrome(_ words: [String]) -> String {
        for word in words {
            let arr = Array(word)
            var l = 0, r = arr.endIndex-1
            var isPalindrome = true
            while l<r {
                if arr[l] != arr[r] {
                    isPalindrome = false
                    break
                }
                l += 1
                r -= 1
            }
            if isPalindrome { return word }
        }
        return ""
    }