//Remove Palindromic Subsequences
//O(n), O(n)
    func removePalindromeSub(_ s: String) -> Int {
        if s.count == 0 {return 0}
        let arr = Array(s)
        if arr == Array(arr.reversed()) {
            return 1
        }
        return 2
    }