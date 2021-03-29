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