//Find the Difference
//O(s+t), O(s+t)
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var sdict = [Character: Int]()
        for char in s {
            sdict[char, default:0] += 1
        }
        var tdict = [Character: Int]()
        for char in t {
            tdict[char, default:0] += 1
        }
        for (char, val) in tdict {
            if sdict[char, default: 0] != val {
                return char
            }
        }
        return Character("")
    }

// O(s+t), O(s+t)
    func findTheDifference(_ s: String, _ t: String) -> Character {
        
        let sArr = Array(s), tArr = Array(t)
        var memo = [Character: Int]()
        for char in sArr {
            memo[char, default: 0] += 1
        }
        for char in tArr {
            memo[char, default: 0] -= 1
            if memo[char]! < 0 {
                return char
            }
        }
        return Character("")
    }