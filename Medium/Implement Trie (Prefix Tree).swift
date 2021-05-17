/*Implement Trie (Prefix Tree)*/

class Trie {
    //struct is not work for this case, we need reference
    class Node {
        var dict: Dictionary<Character, Node> = [:]
        var isEnd: Bool = false
    }
    let root = Node()
    //time O(n) space O(n)
    func insert(_ word: String) {
        var curr = root
        for char in word {
            if curr.dict[char] == nil {
                curr.dict[char] = Node()
            }
            curr = curr.dict[char]!
            
        }
        curr.isEnd = true
    }

    func searchNode(_ word: String) -> TrieNode? {
        var curr = root
        for char in word {
            if curr.dict[char] == nil {return nil}
            curr = curr.dict[char]!
        }
        return curr
    }

    //time O(n) space O(1)
    func search(_ word: String) -> Bool {
        var curr = searchNode(word)
        return curr != nil && curr!.isEnd
    }
    
    //time O(n) space O(1)
    func startsWith(_ prefix: String) -> Bool {
        var curr = searchNode(prefix)
        return curr != nil
    }


}