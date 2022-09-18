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

//Trie O(n*k^2) O((n+k)^2), TLE
class Solution {
    class Trie {
        var wordIndex: Int = -1
        var dict = [Character: Trie]()
        var palindromPrefixRemaining = [Int]()
    }
    func hasPalindromeRemaining(_ s: String, _ i: Int) -> Bool {
        let sArr = Array(s)
        var l = i, r = sArr.endIndex - 1
        while l < r {
            if sArr[l] != sArr[r] {return false}
            l += 1; r -= 1
        }
        return true
    }
    
    func palindromePairs(_ words: [String]) -> [[Int]] {
        let root = Trie()
        for (i, word) in words.enumerated() {  //O(words.len * word.len * word.len) = O(n*k^2)
            let reversedWord = String(word.reversed())
            var curr = root
            let reversedWordArr = Array(reversedWord)
            for j in 0..<reversedWordArr.endIndex {
                if hasPalindromeRemaining(reversedWord, j) { 
                    curr.palindromPrefixRemaining.append(i)
                }
                let char = reversedWordArr[j]
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.wordIndex = i
        }
        
        var res = [[Int]]()
        nextWord: for (i, word) in words.enumerated() { //O(words.len * word.len * word.len) = O(n*k^2)
            var curr = root
            let wArr = Array(word)
            for j in 0..<word.count { //case 3 
                if curr.wordIndex != -1 && hasPalindromeRemaining(word, j) { //if suffix exist
                    let suffixIndex = curr.wordIndex
                    res.append([i, suffixIndex]) 
                }
                let char = wArr[j]
                if curr.dict[char] == nil {
                    continue nextWord
                }
                curr = curr.dict[char]!
            }
            
            if curr.wordIndex != -1 && curr.wordIndex != i { //case 1 both two words len is equal
                res.append([i, curr.wordIndex])
            }
            for other in curr.palindromPrefixRemaining { // case 2 if prefix exist
                res.append([i, other])
            }
        }
        return res
    }
    
}

//Dictionary O(k^2*n) O(n),k is word.len, n is words.len, using set remove duplicate pairs. TLE
class Solution {
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var dict = [String: Int]()
        for (i,word) in words.enumerated() {
            dict[word] = i
        } 
        var pairs = [[Int]]()
        
        for (i, word) in words.enumerated() {
            let wArr = Array(word)
            for j in 0...wArr.endIndex {
                let prefix = String(wArr[0..<j])
                let suffix = String(wArr[j...])
                if isPalindrome(prefix), let restIndex = dict[String(suffix.reversed())], restIndex != i {
                    pairs.append([restIndex, i])
                }
                if isPalindrome(suffix), let restIndex = dict[String(prefix.reversed())], restIndex != i {
                    pairs.append([i, restIndex])
                }
            }
            
        }
        return Array(Set(pairs))
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let sArr = Array(s)
        var l = 0, r = sArr.endIndex - 1
        while l < r { 
            if sArr[l] != sArr[r] {return false}
            l += 1; r -= 1
        }
        return true
    }
}