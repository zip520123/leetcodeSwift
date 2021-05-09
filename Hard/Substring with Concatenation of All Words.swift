/*Substring with Concatenation of All Words*/
//brute force time(n!) space O(n!)
func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    var set = Set<String>()
    
    func dfs(_ curr: String, _ words: [String]) {
        var words = words
        if words.endIndex == 0{
            set.insert(curr)
            return
        }
        var prev = ""
        for i in 0..<words.endIndex {
            let word = words.remove(at: i)
            if prev != word {
                dfs(curr+word, words)    
            } 
            prev = word
            words.insert(word, at: i)
        }
    }
    if words.endIndex == 0 {
        return []
    }
    dfs("",words)
    print(set)
    let length = words[0].count * words.endIndex
    
    let sArr = Array(s)
    if sArr.endIndex - length < 0 {
        return []
    }
    var res = [Int]()
    for i in 0..<sArr.endIndex - length + 1 {
        let curr = String(sArr[i..<i+length])
        if set.contains(curr) {
            res.append(i)
        }
    }
    return res
}

//sliding window time O(s.length * words.length) space O(words) TLE
class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var dict = [String:Int]()
        let step = words[0].count
        let wordlength = words.endIndex * step
        for word in words {
            dict[word,default:0]+=1
        }
        let sArr = Array(s)
        var res = [Int]()
        var l = 0, r = 0
        while l < sArr.endIndex - wordlength + 1 {
            let curr = String(sArr[l..<l+wordlength])
            if check(curr, dict, step) {
                res.append(l)
            }
            
            l += 1
        }
        return res
    }
    
    func check(_ word: String, _ dict: [String: Int], _ step: Int) -> Bool {
        var dict = dict
        var index = 0
        let wArr = Array(word)
        while index < wArr.endIndex - step + 1 {
            let curr = String(wArr[index..<index+step])
            if dict[curr, default: 0] == 0 {
                return false
            } else {
                dict[curr]! -= 1
                if dict[curr]! < 0 {
                    return false
                }
            }
            index += step
        }
        return true
    }
}

//O(s*words) O(words) map
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var count = [String: Int]()
        for word in words {
            count[word, default:0] += 1
        }
        var res = [Int]()
        let sArr = Array(s), len = words[0].count, numOfwords = words.endIndex
        for i in 0..<sArr.endIndex - len * numOfwords + 1 {
            var seen = [String: Int]()
            var j = 0
            while j < numOfwords {
                let currWord = String(sArr[i+j*len..<i+(j+1)*len])
                if count[currWord] != nil {
                    seen[currWord, default: 0] += 1
                    if seen[currWord]! > count[currWord]! {
                        break
                    }
                } else {
                    break
                }
                j += 1 
            }
            if j == numOfwords {
                res.append(i)
            }
        }
        return res
    }

class Solution {
    class Trie {
        var dict = [Character: Trie]()
        var word : String?
    }
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let root = Trie()
        var count = [String: Int]()
        for word in words {
            count[word, default:0] += 1
            var curr = root
            let sArr = Array(word)
            for char in sArr {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.word = word
        }
        let sArr = Array(s), len = words[0].count, numOfWords = words.endIndex
        var res = [Int]()
        nextChar: for i in 0..<sArr.endIndex - len * numOfWords + 1 {
            var j = 0
            var seen = [String: Int]()
            while j < numOfWords {
                var curr = root
                for k in i+j*len..<i+(j+1)*len {
                    let char = sArr[k]
                    if curr.dict[char] == nil {
                        continue nextChar
                    }
                    curr = curr.dict[char]!
                }
                
                let word = curr.word!
                seen[word, default:0] += 1
                if seen[word]! > count[word]! {
                    continue nextChar
                }
                j += 1
            }
            res.append(i)
        }
        return res
    }
}