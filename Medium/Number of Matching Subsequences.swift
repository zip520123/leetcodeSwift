//Number of Matching Subsequences
//O(s*words.len*word.len) O(1) TLE
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var res = 0
        let sArr = Array(s)
        
        nextWord: for word in words {
            let wArr = Array(word)
            var i = 0
            for char in sArr {
                if char == wArr[i] {
                    i += 1
                    if i == wArr.endIndex {
                        res += 1
                        continue nextWord
                    }
                }
            }    
        }
        return res
    }

//O(s+word.len*words.len) O(words.len*word.len) 
/*
"abcde" ["a","bb","acd","ace"]
Put words into dict for its first char as key
a :["a","acd","ace"]
b :["bb"]
Go through s remove each word first and put it in new dict
a -> []
c: ["cd", "ce"]
*/
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var res = 0
        let sArr = Array(s)
        var dict = [Character:[String]]()
        for word in words {
            let wArr = Array(word)
            dict[wArr[0], default:[]].append(word)
        }
        
        for char in sArr {
            let currList = dict[char, default:[]]
            dict[char] = []
            for s in currList {
                var newWord = Array(s)
                newWord.removeFirst()
                if newWord.endIndex == 0 {
                    res += 1
                    continue
                }
                dict[newWord[0], default:[]].append(String(newWord))
            }
            
        }
        return res
    }

//set O(mn) O(words) Using set exclude or include the word already seen
    func numMatchingSubseq(_ S: String, _ words: [String]) -> Int {
        let sLen = S.count
        var containSet: Set<String> = []
        var excludeSet: Set<String> = []
        if sLen == 0 || words.count == 0 { return 0 }
        let sArray = Array(S)
        var count = 0
        for word in words {
            if containSet.contains(word) {
                count += 1
                continue
            }
            if excludeSet.contains(word) {
                continue
            }
            let wArray = Array(word)
            let wLen = wArray.count
            var w = 0
            var s = 0
            while w < wLen, s < sLen {
                if wArray[w] == sArray[s] {
                    w += 1
                }
                s += 1
            }
            if w == wLen {  // pointer stops at the end+1 of word, that means we got a matching subsequence
                count += 1
                containSet.insert(word)
            } else {
                excludeSet.insert(word)
            }
        }
        return count
    }

//O(s.len*w.len), O(w)
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var res = 0
        let sArr = Array(s)
        var includeSet = Set<String>(), excludeSet = Set<String>()
        
        for word in words {
            if includeSet.contains(word) {
                res += 1
                continue
            }
            if excludeSet.contains(word) {
                continue
            }
            let wArr = Array(word)
            var l = 0, r = 0
            while l < sArr.endIndex && r < wArr.endIndex {
                if sArr[l] == wArr[r] {
                    r += 1
                }
                l += 1    
            }
            if r == wArr.endIndex {
                res += 1
                includeSet.insert(word)
            } else {
                excludeSet.insert(word)
            }
        }
        return res
    }