/*KMP*/
func kmpSearch(_ s: String, _ pat: String) -> [Int] {
    var i = 0, j = 0
    let list = longestSuffixList(pat)
    let sArr = Array(s), pArr = Array(pat)
    var res = [Int]()
    while i < sArr.endIndex {
        if sArr[i] == pArr[j] {
            i += 1
            j += 1
        }
        if j == pArr.endIndex {
            res.append(i-j)
            j = list[j - 1]
        } else if i < sArr.endIndex && pArr[j] != sArr[i] {
            if j != 0 {
                j = list[j - 1]
            } else {
                i = i + 1
            } 
        }
    }
    return res
}
func longestSuffixList(_ s: String) -> [Int] {
    var i = 1, len = 0
    let sArr = Array(s)
    var res = [0]
    while i < sArr.endIndex {
        if sArr[i] == sArr[len] {
            len += 1
            i += 1
            res.append(len)
        } else {
            if len == 0 {
                res.append(0)
                i += 1
            } else {
                len = res[len - 1]
            }
        }
    }
    return res
}
print(kmpSearch("cabcabca","abc"))
print(kmpSearch("aaababcabc","abc"))