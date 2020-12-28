/*Valid Palindrome*/
//time O(n) space O(n), contains time O(1)
func isPalindrome(_ s: String) -> Bool {
        
    var s = s.replacingOccurrences(of: " ", with: "")
    let numeric = "0"..."9"
    let alpha = "a"..."z"
    let arrS = Array(s.lowercased()).filter { 
        numeric.contains(String($0)) || alpha.contains(String($0)) }
    let scount = arrS.count
    var left = 0
    var right = scount - 1
    
    while (left <= right) {
        var lhs = arrS[left]
        var rhs = arrS[right]
        
        if lhs != rhs {return false}
        left += 1
        right -= 1
    }
    return true
}