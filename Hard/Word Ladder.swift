/*Word Ladder*/
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var words = Set(wordList)
        if words.contains(endWord) == false {
            return 0
        }
        var step = 0
        var topList = [beginWord]
        var seen = Set<String>()
        while !topList.isEmpty {
            let currWords = topList
            topList.removeAll()
            step += 1
            
            for word in currWords {
                if word == endWord {
                    return step
                }
                let wArr = Array(word)
                for i in 0..<wArr.endIndex {
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        let newWord = String(wArr[0..<i] + [char] + wArr[i+1..<wArr.endIndex])
                        
                        if words.contains(newWord) && seen.contains(newWord) == false {
                            
                            topList.append(newWord)
                            seen.insert(newWord)

                        }
                    }
                    
                }
            }
            
        }
        return 0
    }