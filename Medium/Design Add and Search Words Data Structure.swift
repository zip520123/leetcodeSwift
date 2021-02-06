/*Design Add and Search Words Data Structure*/

class WordDictionary {
    class Node {
        var dict: Dictionary<Character, Node> = [:]
        var isEnd: Bool = false
    }
    
    let root = Node()
    
    func addWord(_ word: String) {
        var curr = root
        for char in word {
            if let node = curr.dict[char] {
                curr = node
            } else {
                curr.dict[char] = Node()
                curr = curr.dict[char]!    
            }
        }
        curr.isEnd = true
    }
    //time O(dict.words) space O(s)
    func dfs(_ s:String, _ curr: Node) -> Bool {
        var curr = curr
        let sArr = Array(s)
        if sArr.endIndex == 0 {
            return curr.isEnd
        }
        var i = 0
        while i<sArr.endIndex {
            let char = sArr[i]
            if let node = curr.dict[char] {
                curr = node
            } else {
                if char == "." {
                    var res = false
                    for (_, node) in curr.dict {
                        res = res || dfs(String(sArr[i+1..<sArr.endIndex]), node)
                        if res == true {
                            return res
                        }
                    }
                    return res    
                } else {
                    return false
                }
            }
            i += 1
        }
        return curr.isEnd == true
    }

    
    func search(_ word: String) -> Bool {
        return dfs(word,root)
    }
}




/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */

 let obj = WordDictionary()
 obj.addWord("a")
 print(obj.search(".a"))
 print(obj.search("a."))