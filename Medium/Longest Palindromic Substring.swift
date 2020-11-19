/*Longest Palindromic Substring*/
//time O(n^2) space O(s)
func longestPalindrome(_ s: String) -> String {
    var i = 0
    var resCount = 0
    var resL = 0
    var resR = 0
    let scount = s.count
    let arrS = Array(s)
    while(i < scount) {
        var left = i, right = i
        while right + 1 < scount && arrS[right + 1] == arrS[left] {
            right += 1
        } 
        while(left - 1 >= 0 && right + 1 < scount && arrS[left - 1] == arrS[right + 1]) {
            left -= 1
            right += 1
        }
        
        if right - left + 1 > resCount {
            resCount = right - left + 1
            resL = left
            resR = right
        }
        i += 1
    }
    let res = arrS[resL...resR].map{String($0)}.joined()
    
    return res
}
// let input = "babad"
let input = "ccc"
print(longestPalindrome(input))