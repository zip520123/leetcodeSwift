/*Word Ladder II*/
//time O(n!) space O(n!) TLE
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var length = Int.max
        let words = Set(wordList)
        var res = [[String]]()
        if words.contains(endWord) == false { return []}
        
        func dfs(_ path:[String], _ word: String) {
            if path.endIndex > length {
                return 
            }
            if word == endWord {
                if path.endIndex < length {
                    length = path.endIndex
                    res.removeAll()
                    res.append(path)
                } else if path.endIndex == length {
                    res.append(path)
                }
                return 
            }
            var seen = Set(path)
            let wArr = Array(word)
            for i in 0..<wArr.endIndex {
                for char in "abcdefghijklmnopqrstuvwxyz" {
                    let newWord = String(wArr[0..<i]+[char]+wArr[i+1..<wArr.endIndex])
                    if words.contains(newWord) && seen.contains(newWord) == false {
                        dfs(path+[newWord], newWord)
                    } 
                }    
            }
            
        }
        
        dfs([beginWord],beginWord)
        return res
    }

//bfs time O(n!) space O(n!) TLE
func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var res = [[String]]()
        var length = Int.max
        var words = Set(wordList)
        if words.contains(endWord) == false {return []}
        var queue = [[beginWord]]
        var dict = [String: [String]]()
        words.insert(beginWord)
        for word in words {
            let wArr = Array(word)
            for i in 0..<wArr.endIndex {
                for char in "abcdefghijklmnopqrstuvwxyz" {
                    let newWord = String(wArr[0..<i] + [char] + wArr[i+1..<wArr.endIndex])
                    dict[word, default:[]].append(newWord)
                }

            }
        }
        
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            var gotYou = false
            for list in temp {
                let word = list.last!
                let seen = Set(list)
                
                for newWord in dict[word]! {
                    if words.contains(newWord) && seen.contains(newWord) == false {
                        let path = list + [newWord]
                        if newWord == endWord {
                            gotYou = true
                            res.append(path)
                        } else {
                            queue.append(path)    
                        }
                    }
                }

            }
            if gotYou {
                return res
            }
        }
        return []
    }


class Solution {
	
	func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
		guard wordList.contains(endWord) else { return [] }
        var dict: [String: [String]] = [:]
		for word in wordList {
			for(_, i) in word.indices.enumerated() {
				let generic = String(word[..<i]) + "*" + String(word[word.index(after: i)...])
				dict[generic, default: []].append(word)
			}
		}

		var queue: [[String]] = []
		var visited: Set<String> = []
		var currPath: [String] = []
		var answer: [[String]] = []
		
		queue.append([beginWord])
		visited.insert(beginWord)
		currPath.append(beginWord)
		
		var level = 1
		var tmpVisits: [String] = []

		while !queue.isEmpty {
			let path = queue.removeFirst()
			if path.count > level {
				visited.formUnion(tmpVisits)
				tmpVisits.removeAll()
				level += 1
			}
			
			guard let last = path.last else { continue }
			for (_, i) in last.indices.enumerated() {
				let generic = String(last[..<i] + "*" + last[last.index(after: i)...])
				guard let nexts = dict[generic] else {
					continue }
				for next in nexts {
					
					guard !visited.contains(next) else { continue }
					var newPath = path
					newPath.append(next)
					//visited.insert(next)
					tmpVisits.append(next)
					
					if next == endWord {
						answer.append(newPath)
						visited.remove(next)
					} else {
						queue.append(newPath)
					}
				}
			}
		} // while !queue.isEmpty
		
		return answer
	}
}