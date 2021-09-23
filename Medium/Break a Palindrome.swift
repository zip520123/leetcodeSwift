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