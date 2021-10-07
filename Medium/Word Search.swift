/*Word Search*/
//O(board*word), O(board*word)
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let wArr = Array(word), rows = board.endIndex, cols = board[0].endIndex
        var board = board
        func dfs(_ x: Int, _ y: Int, _ index: Int) -> Bool {
            if index == wArr.endIndex {return true}
            guard x>=0, y>=0, x<rows, y<cols else {return false}
            
            if board[x][y] == wArr[index] {
                let temp = board[x][y]
                board[x][y] = "."
                if dfs(x+1,y,index+1) == true {return true}
                if dfs(x-1,y,index+1) == true {return true}
                if dfs(x,y+1,index+1) == true {return true}
                if dfs(x,y-1,index+1) == true {return true}
                board[x][y] = temp
             }
            return false
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if dfs(i,j,0) == true {return true}
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