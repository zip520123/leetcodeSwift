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

    class Trie {
        var dict = [Character: Trie]()
        var isEnd = false
    }   
    
    let head = Trie()
    
    func addWord(_ word: String) {
        var curr = head
        for char in word {
            if curr.dict[char] == nil {
                let newNode = Trie()
                curr.dict[char] = newNode
                curr = newNode
            } else {
                curr = curr.dict[char]!
            }
        }
        curr.isEnd = true
    }
    
    func search(_ node: Trie, _ word: String) -> Bool {
        var curr = node 
        for (i,char) in word.enumerated() {
            if char == "." {
                var res = false
                let sArr = Array(word)
                for (key, node) in curr.dict {
                    res = res || search(node, String(sArr[i+1..<sArr.endIndex]))
                    if res == true {return true}
                }
                return res
            } else if curr.dict[char] != nil {
                curr = curr.dict[char]!
            } else {
                return false
            }
        }
        return curr.isEnd
    }
    
    func search(_ word: String) -> Bool {
        return search(head,word)
    }

//O(n), O(n), n = word.len
/*
Time complexity: O(M) for the "well-defined" words without dots, 
where MM is the key length, and NN is a number of keys, and O(N⋅26 M) for the "undefined" words. 
 That corresponds to the worst-case situation of searching an undefined word text M times
  which is one character longer than all inserted keys.
Space complexity: O(1) for the search of "well-defined" words without dots, and up to O(M) for the "undefined" words, to keep the recursion stack.
*/
class WordDictionary {
    class Trie {
        var dict = [Character: Trie]()
        var isEnd = false
    }
    let root = Trie()

    func addWord(_ word: String) {
        var curr = root
        for char in word {
            if curr.dict[char] == nil {
                curr.dict[char] = Trie()               
            }
            curr = curr.dict[char]!
        }
        curr.isEnd = true
    }
    
    func searchWith(_ node: Trie, _ word: String) -> Bool {
        var curr = node
        let wArr = Array(word)
        for i in 0..<wArr.endIndex {
            let char = wArr[i]
            if char == "." {
                var res = false
                let rest = String(wArr[(i+1)...])
                for subnode in curr.dict.values {
                    res = res || searchWith(subnode, rest)
                }
                return res
            } else if curr.dict[char] == nil {
                return false
            } else {
                curr = curr.dict[char]!
            }
            
        }
        return curr.isEnd
    }
    
    func search(_ word: String) -> Bool {
        return searchWith(root, word)
    }
}