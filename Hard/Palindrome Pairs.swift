/*Palindrome Pairs*/
//brute force O(n^2*L) space O(1)
//n is each word, L is the linear path to check the palindrom
func palindromePairs(_ words: [String]) -> [[Int]] {
    var res = [[Int]]()
    for i in 0..<words.endIndex - 1 {
        for j in i+1..<words.endIndex {
            if isPalindrom(words[i] + words[j]) {
                res.append([i,j])
            }
            if isPalindrom(words[j] + words[i]) {
                res.append([j,i])
            }
        }
    }
    
    return res
}

func isPalindrom(_ word: String) -> Bool {
    var wArr = Array(word)
    var left = 0, right = wArr.endIndex - 1
    while left < right {
        if wArr[left] != wArr[right] {
            return false
        }
        left += 1
        right -= 1
    }
    
    return true
}