//Alien Dictionary
    func alienOrder(_ words: [String]) -> String {
        var adjList = [Character: [Character]]()
        var counts = [Character: Int]()
        for word in words {
            for char in word {
                counts[char] = 0
            }
        }
        var i = 0
        while i < words.endIndex - 1 {
            let word1 = Array(words[i]), word2 = Array(words[i+1])
            
            var j = 0
            while j < word1.endIndex && j < word2.endIndex {
                if word1[j] != word2[j] {
                    adjList[word1[j], default:[]].append(word2[j])
                    counts[word2[j], default:0] += 1
                    break
                }
                j += 1
            }
            if j == word2.endIndex && word1.endIndex > word2.endIndex {
                return ""
            }
            i += 1
        }
        var chars = [Character]()
        var queue = [Character]()
        for (char, count) in counts {
            if count == 0 {
                queue.append(char)
            }
        }
        
        while queue.isEmpty == false {
            let char = queue.removeFirst()
            chars.append(char)
            for adj in adjList[char, default:[]] {
                counts[adj]! -= 1
                if counts[adj]! == 0 {
                    queue.append(adj)
                }
            }
        }
        if chars.endIndex < counts.count {
            return ""
        }
        return String(chars)
    }
    