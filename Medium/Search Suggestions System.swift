//Search Suggestions System
//O(n log n + m),O(n*k), n = products.len * product.len , m = searchWord
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