//Ransom Note
//O(ransomNote+magazine), O(magazine)
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        for char in magazine {
            dict[char, default: 0] += 1
        }
        for char in ransomNote {
            dict[char, default:0] -= 1
            if dict[char]! < 0 {return false}
        }
        return true
    }