//Determine if Two Strings Are Close
//O(n), O(n)
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count {return false}
        var dict1 = [Character: Int](), dict2 = [Character: Int]()
        
        for char in word1 {
            dict1[char, default:0] += 1
        }
        
        for char in word2 {
            dict2[char, default: 0] += 1
        }
        
        if dict1 == dict2 {return true}
        
        let keySet1 = Set(dict1.keys), keySet2 = Set(dict2.keys)

        var countDict1 = [Int: Int](), countDict2 = [Int: Int]()
        
        for count in dict1.values {
            countDict1[count, default:0] += 1
        }
        
        for count in dict2.values {
            countDict2[count, default:0] += 1
        }
        
        return keySet1 == keySet2 && countDict1 == countDict2 
    }