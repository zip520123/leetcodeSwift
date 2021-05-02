/*Word Ladder II*/
//O(n!) TLE
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let wordSet = Set(wordList)
        if wordSet.contains(endWord) == false {
            return []
        }
        var res = [[String]]()
        var queue: [([String],Set<String>)] = [([beginWord], Set())]
        var finded = false
        while queue.isEmpty == false && finded == false {
            let temp = queue
            queue.removeAll()
            for (path, seen) in temp {
                let lastWord = Array(path.last!)
                if path.last! == endWord {
                    finded = true
                    res.append(path)
                    continue
                }
                for i in 0..<lastWord.endIndex {
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        let newWord = String(lastWord[0..<i] + [char] + lastWord[i+1..<lastWord.endIndex])
                        if wordSet.contains(newWord) && seen.contains(newWord) == false {
                            var newSeen = seen
                            newSeen.insert(newWord)
                            queue.append((path+[newWord], newSeen))
                        }
                    }
                    
                }
            }
        }
        return res
    }

//BFS 
//We don't insert next word to visited immediately. because it's also a possible candidate for other path at the same level. 
//union tempVisit to visited at each level start, to eliminate duplicate search.
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        let wordSet = Set(wordList)
        if wordSet.contains(endWord) == false {
            return []
        }
        var res = [[String]]()
        var queue: [[String]] = [[beginWord]]
        var finded = false
        var tempSeen = Set<String>()
        var visited = Set<String>()
        
        while queue.isEmpty == false && finded == false {
            let temp = queue
            queue.removeAll()
            visited.formUnion(tempSeen)
            tempSeen.removeAll()
            
            for path in temp {
                let lastWord = Array(path.last!)
                if path.last! == endWord {
                    finded = true
                    res.append(path)
                }

                for i in 0..<lastWord.endIndex {
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        let newWord = String(lastWord[0..<i] + [char] + lastWord[i+1..<lastWord.endIndex])
                        if wordSet.contains(newWord) && visited.contains(newWord) == false {
                            tempSeen.insert(newWord)
                            queue.append(path+[newWord])
                        }
                    }
                }
            }
        }
        return res
    }