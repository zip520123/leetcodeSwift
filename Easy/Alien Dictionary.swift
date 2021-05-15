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
    
    //O(n), O(n), n = sum(words.word.len)
        func alienOrder(_ words: [String]) -> String {
        var counts = [Character: Int]()
        var graph = [Character:[Character]]()
        for word in words {
            for char in word {
                counts[char] = 0
            }
        }
        for i in 0..<words.endIndex - 1 {
            let w1 = Array(words[i]), w2 = Array(words[i+1])
            var j = 0
            while j < w1.endIndex && j < w2.endIndex {
                if w1[j] != w2[j] {
                    graph[w1[j], default:[]].append(w2[j])
                    counts[w2[j], default:0] += 1
                    break
                }
                j += 1
            }
            if j == w2.endIndex && w2.endIndex < w1.endIndex {
                return ""
            }
        }
        var queue = [Character]()
        for (char, value) in counts {
            if value == 0 {
                queue.append(char)
            }
        }
        var chars = [Character]()
        while !queue.isEmpty {
            let char = queue.removeFirst()
            chars.append(char)
            
            for nei in graph[char, default:[]] {
                counts[nei]! -= 1
                if counts[nei]! == 0 {
                    queue.append(nei)
                }
            }
        }
        if chars.endIndex < counts.count {
            return ""
        }
        return String(chars)
    }