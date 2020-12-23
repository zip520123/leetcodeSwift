/*Word Search*/
func exist(_ board: [[Character]], _ word: String) -> Bool {
    var wArr = Array(word)
    let wcount = word.count
    var board = board 
    let row = board.count
    let col = board[0].count
    func dfs(_ index: Int,_ x: Int,_ y: Int) -> Bool {
        if index == wcount {return true}
        if x < 0 || x >= row || y < 0 || y >= col || board[x][y] == "*" || board[x][y] != wArr[index]{
            return false
        }
        let t = board[x][y]
        board[x][y] = "*"
        let r1 = dfs(index+1,x+1,y) || dfs(index+1,x-1,y) || dfs(index+1,x,y+1) || dfs(index+1,x,y-1)
        board[x][y] = t
        
        return r1
    }
    
    for (i,row) in board.enumerated() {
        for (j,char) in row.enumerated() {
            if char == wArr[0] {
                if dfs(0,i,j) == true {
                    return true
                }   
            }
        }
    }
    
    return false
}