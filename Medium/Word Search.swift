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
//Trie
class Solution {
    class Trie {
        var dict = [Character: Trie]()
        var isEnd = false
    }
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let root = Trie()
        var curr = root
        for char in word {
            if curr.dict[char] == nil {
                curr.dict[char] = Trie()
            }
            curr = curr.dict[char]!
        }
        curr.isEnd = true
        var board = board
        let rows = board.endIndex, cols = board[0].endIndex
        let direction = [0,1,0,-1,0]
        func dfs(_ node: Trie, _ x: Int, _ y: Int) -> Bool {
            if node.isEnd == true {return true}
            guard x>=0, x<rows, y>=0, y<cols else {return false}
            let char = board[x][y]
            var res = false
            if let next = node.dict[char] {
                board[x][y] = "±"
                for k in 0..<4 {
                    let newX = x+direction[k], newY = y+direction[k+1]
                    res = res || dfs(next,newX,newY)
                }
                board[x][y] = char
            }
            return res
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if dfs(root,i,j) == true {
                    return true
                }
            }
        }
        return false
    }
}