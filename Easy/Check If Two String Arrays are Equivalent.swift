//Check If Two String Arrays are Equivalent
//O(n), O(n)
func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {        
    return word1.reduce("",+) == word2.reduce("",+)
}

func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
    word1.joined() == word2.joined()
}