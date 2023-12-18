/*Valid Anagram*/
//time O(2s + t), space O(s)
func isAnagram(_ s: String, _ t: String) -> Bool {
    var dict = [Character: Int]()
    let sArr = Array(s), tArr = Array(t)
    for char in sArr {
        dict[char, default:0] += 1
    }
    for char in tArr {
        dict[char,default:0] -= 1
        if dict[char]! < 0 {return false}
    }
    for (_, val) in dict {
        if val > 0 {return false}
    }
    return true
}

//time O(s+t) space O(s+t)
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

// O(s+t), O(s)
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {return false}
    var dict = [Character: Int]()
    for char in s {
        dict[char, default: 0] += 1
    }
    for char in t {
        dict[char, default: 0] -= 1
        if dict[char]! < 0 {return false}
    }
    return true
}