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

    func isPalindrome(_ s: String) -> Bool {
        
        let set = Set("abcdefghijklmnopqrstuvwxyz0123456789")
        var sArr = Array(s.lowercased()).filter { set.contains($0) }
        
        var l = 0, r = sArr.endIndex-1
        while l < r {
            if sArr[l] != sArr[r] {return false}    
            l += 1
            r -= 1
        }
        return true
    }

    func isPalindrome(_ s: String) -> Bool {
        var arr = [Character]()
        for char in s {
            switch char {
                case "a"..."z", "0"..."9":
                    arr.append(char)
                case "A"..."Z":
                    arr.append(Character(char.lowercased()))
                default:
                    break
            }
        }

        var left = 0, right = arr.endIndex - 1 
        while left < right {
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }