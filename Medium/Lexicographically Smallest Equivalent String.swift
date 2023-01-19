//Lexicographically Smallest Equivalent String
//union find: O((s1+s2+baseStr) log |unique characters in s1 and s2|), O(|unique characters in s1 and s2|)
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        var dict = [Character: Character]()
        for char in s1 {
            dict[char] = char
        }
        for char in s2 {
            dict[char] = char
        }
        
        func find(_ char: Character) -> Character {
            if dict[char] == nil {
                dict[char] = char
            }
            let root = dict[char]! 
            if root != char {
                dict[char] = find(root)
            }
            return dict[char]!
        }
        
        func union(_ node1: Character, _ node2: Character) {
            let root1 = find(node1), root2 = find(node2)
            if root1 < root2 {
                dict[root2] = root1    
            } else {
                dict[root1] = root2
            }
        }
        
        for (char1, char2) in zip(s1, s2) {
            union(char1, char2)
        }
        var res = ""
        for char in baseStr {
            res += String(find(char))
        }
        return res
    }