/*Valid Anagram*/
//time O(s + t), space O(s)
func isAnagram(_ s: String, _ t: String) -> Bool {
    var dict = Dictionary<Character, Int>()
    let sArr = Array(s)
    for char in sArr {
        dict[char,default:0] += 1
    }
    for char in Array(t) {
        if dict[char] == nil {
            return false
        } else {
            dict[char]! -= 1
            if dict[char]! < 0 {
                return false
            }
        }
    }
    
    for (_,value) in dict {
        if value != 0 {
            return false
        }
    }
    return true
}