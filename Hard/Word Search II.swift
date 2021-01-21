/*Word Search II*/
//time O(words * row * col) space O(1) or O(board)
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