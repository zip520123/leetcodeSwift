//Search Suggestions System
//O(n log n + m),O(n), n = products.len * product.len , m = searchWord
    class Trie {
        var dict = [Character: Trie]()
        var words = [String]()
    }
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var res = [[String]]()
        let products = products.sorted() //O(n log n)
        let root = Trie()
        for product in products {
            var curr = root 
            for char in product {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
                curr.words.append(product)
            }
        }
        var curr = root
        let sArr = Array(searchWord)
        for i in 0..<searchWord.count {
            let char = sArr[i]
            if curr.dict[char] != nil {
                curr = curr.dict[char]!
                if curr.words.endIndex > 3 {
                    res.append(Array(curr.words[0..<3]))
                } else {
                    res.append(curr.words)    
                }
            } else {
                for _ in i..<searchWord.count {
                    res.append([])    
                }
                break
            }
        }
        return res
    }

//O(n log n), O(n^2)
class Solution {
    class Trie {
        var dict = [Character: Trie]()
        var arr = [String]()
    }
    let root = Trie()
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let arr = products.sorted() //O(n log n)
        for word in arr {
            var curr = root
            for char in word {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                
                curr = curr.dict[char]!
                curr.arr.append(word)
            }
        }
        
        var res = [[String]]()
        for i in 0..<searchWord.count {
            res.append([])
        }
        var curr = root
        for (i,char) in searchWord.enumerated() {
            if let node = curr.dict[char] {
                if node.arr.count > 3 {
                    res[i] = Array(node.arr[0..<3])
                } else {
                    res[i] = node.arr
                }
                curr = curr.dict[char]!
            } else {
                break
            }
        }
        return res
    }
}