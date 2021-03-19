/*Word Search II*/
//dfs time O(words * row * col) space O(1) or O(board) TLE
func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    var board = board
    var res = [String]()
    let row = board.endIndex
    let col = board[0].endIndex
    
    func dfs(_ index: Int, _ s: String,_ x: Int, _ y: Int) -> Bool {
        let sArr = Array(s)
        if index == sArr.endIndex {
            return true
        }
        if x < 0 || x >= row || y < 0 || y >= col || board[x][y] == "_" {
            return false
        }
        
        if sArr[index] == board[x][y] { 
            let temp = board[x][y]
            board[x][y] = "_"
            var res = false
            res = res || dfs(index+1,s,x+1,y)
            res = res || dfs(index+1,s,x,y+1)
            res = res || dfs(index+1,s,x-1,y)
            res = res || dfs(index+1,s,x,y-1)
            board[x][y] = temp
            return res
        }
        return false
    }
    
    
    word: for word in words {
        for i in 0..<row {
            for j in 0..<col {
                if dfs(0, word,i,j) == true {
                    res.append(word)
                    continue word
                }        
            }
        }
        
    }
    return res
}
//dfs + map time O(board + words) space O(board) TLE
func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    var board = board
    var res = [String]()
    let row = board.endIndex
    let col = board[0].endIndex
    
    func dfs(_ index: Int, _ s: String,_ x: Int, _ y: Int) -> Bool {
        let sArr = Array(s)
        if index == sArr.endIndex {
            return true
        }
        if x < 0 || x >= row || y < 0 || y >= col || board[x][y] == "_" {
            return false
        }
        
        if sArr[index] == board[x][y] { 
            let temp = board[x][y]
            board[x][y] = "_"
            var res = false
            res = res || dfs(index+1,s,x+1,y)
            res = res || dfs(index+1,s,x,y+1)
            res = res || dfs(index+1,s,x-1,y)
            res = res || dfs(index+1,s,x,y-1)
            board[x][y] = temp
            return res
        }
        return false
    }
    
    var map : Dictionary<Character, [[Int]]> = [:]
    for i in 0..<row {
        for j in 0..<col {
            let char = board[i][j]
            map[char, default: []].append([i,j]) 
        }
    }
    word: for word in words {
        let char = Array(word)[0]
        if let points = map[char] { 
            for point in points {
                let i = point[0]
                let j = point[1]
                if dfs(0, word, i, j) == true {
                    res.append(word)
                    continue word
                }
            }
        }
    }
        
    return res
}

//trie tree 
class Trie {
    var dict = Dictionary<Character, Trie>()
    var word: String?
}
func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    let root = Trie()
    
    for word in words {
        var curr = root 
        for char in word {
            if curr.dict[char] == nil {
                let newNode = Trie()
                curr.dict[char] = newNode
                curr = newNode
            } else {
                curr = curr.dict[char]!
            }
        }
        curr.word = word
    }
    
    var board = board 
    let row = board.endIndex
    let col = board[0].endIndex
    var res = [String]()
    
    func dfs(_ x: Int, _ y: Int, _ node: Trie) {
        if x < 0 || y < 0 || x == row || y == col { return }
        guard let next = node.dict[board[x][y]] else {return}
        if let word = next.word {
            res.append(word)
            next.word = nil
        }
        let temp = board[x][y]
        
        board[x][y] = "_"
        dfs(x+1,y,next)
        dfs(x-1,y,next)
        dfs(x,y+1,next)
        dfs(x,y-1,next)
        board[x][y] = temp

                // SPEED UP TRICK:
        // What are we doing here?
        // While backtracking we removing all the leaf nodes and as we go up we would be also be removing some of
        // parent nodes that now became leaf nodes because of the removal of the children. By doing this we are making the 
        // Trie much smaller 
        
        // Now we know what we are doing here
        // Lets understand why we are doing this
        // We reach a leaf node only if we found a string matching that leaf node on the board
        // All leaf nodes would be the end of a complete word, so after we find the word there is no need to 
        // keep the elements of the word as we dont need duplicates. Finding the word once is enough. Incase we also wanted
        // how many times a particular word occured in the board we should not do this but in this case we dont need that. So we can safely remove the leaf node and we would also be removing its parent while we backtrack till the beginning of the word until we see that the parent has atleast one child.
        
        // This severely speeds up the algorithm 2400ms -> 4ms!!!!!!
        if next.dict.isEmpty {
            node.dict[temp] = nil
        }
    } 
    
    for i in 0..<row {
        for j in 0..<col {
            dfs(i,j,root)
        }
    }

    return res
}