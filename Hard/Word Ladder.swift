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
    
//
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var words1 = Set([beginWord])
        var words2 = Set([endWord])
        let list = Set(wordList)
        if list.contains(endWord) == false {return 0}
        var seen = Set<String>()
        var step = 0
        while !words1.isEmpty {
            step += 1
            var tempSet = Set<String>()
            for word in words1 {
                let wArr = Array(word)
                for i in 0..<wArr.endIndex {
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        let next = String(wArr[0..<i] + [char] + wArr[(i+1)...])
                        if words2.contains(next) {return step + 1}
                        
                        if list.contains(next) && seen.contains(next) == false {
                            tempSet.insert(next)
                            seen.insert(next)
                        }
                    }
                    
                }
            }
            words1 = tempSet
            if words1.count > words2.count {
                (words1, words2) = (words2, words1)
            }
        }
        return 0
    }