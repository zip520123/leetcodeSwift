/*Valid Anagram*/
//time O(2s + t), space O(s)
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

//time O(s+t) space O(s)
func isAnagram(_ s: String, _ t: String) -> Bool {
    var sdict = Dictionary<Character,Int>()
    for char in s {
        sdict[char,default:0]+=1
    }
    var tdict = Dictionary<Character,Int>()
    for char in t {
        tdict[char,default:0]+=1
    }
    return sdict == tdict
}