/*Isomorphic Strings*/
//time O(s+t) space O(s+t)
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var m1 = [Character:Character](), m2 = [Character:Character]()
    let sArr = Array(s), tArr = Array(t)
    if sArr.endIndex != tArr.endIndex {return false}
    
    for (char1, char2) in zip(sArr,tArr) {
        if m1[char1] == nil && m2[char2] == nil {
            m1[char1] = char2
            m2[char2] = char1
        } else if m1[char1] == nil || m2[char2] == nil {
            return false
        } else if m1[char1]! != char2 || m2[char2]! != char1 {
            return false
        }
    }
    return true
}