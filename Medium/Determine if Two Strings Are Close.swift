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

// O(n), O(n)
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        let set1 = Set(Array(word1)), set2 = Set(Array(word2))
        if set1 != set2 {return false}
        var memo1 = [Character: Int]()
        for char in word1 {
            memo1[char, default: 0] += 1
        }
        var memo2 = [Character: Int]()
        for char in word2 {
            memo2[char, default: 0] += 1
        }
        var memo3 = [Int: Int]()
        for (_, val) in memo1 {
            memo3[val, default: 0] += 1
        }
        var memo4 = [Int: Int]()
        for (_, val) in memo2 {
            memo4[val, default: 0] += 1
        }
        return memo3 == memo4
    }