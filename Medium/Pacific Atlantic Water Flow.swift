/*Pacific Atlantic Water Flow*/
//time O(mn * mn) space O(1)
func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    let row = matrix.endIndex
    let col = matrix[0].endIndex
    var matrix = matrix
    func dfsPacific(_ x: Int,_ y:Int, _ val: Int) -> Bool {
        if x < 0 || y < 0 || x == row || y == col {return false}
        if val >= matrix[x][y] {
            if x == 0 || y == 0 {return true}
            if x == row || y == col {return false}
            let curr = matrix[x][y]
            matrix[x][y] = Int.max
            let able = dfsPacific(x-1,y,curr) ||
            dfsPacific(x+1,y,curr) ||
            dfsPacific(x,y+1,curr) ||
            dfsPacific(x,y-1,curr)
            matrix[x][y] = curr
            return able
        } else {
            return false
        }
        
    }
    
    func dfsAtlantic(_ x:Int, _ y:Int, _ val: Int) -> Bool {
        if x < 0 || y < 0 || x == row || y == col {return false}
        
        if val >= matrix[x][y] {
            if x == row - 1 {return true}
            if y == col - 1 {return true}
            if x == -1 || y == -1 {return false}
            let curr = matrix[x][y]
            matrix[x][y] = Int.max
            let able = dfsAtlantic(x-1,y,curr) ||
            dfsAtlantic(x+1,y,curr) ||
            dfsAtlantic(x,y+1,curr) ||
            dfsAtlantic(x,y-1,curr)
            matrix[x][y] = curr
            return able
        } else {
            return false
        }
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if dfsPacific(i,j, matrix[i][j]) && dfsAtlantic(i,j, matrix[i][j]) {
                res.append([i,j])
            }
        }
    }
    return res
}

//time O(mn*mn) space O(mn)
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    var dictPacific = [[Int]:Bool]()
    var dictAtlantic = [[Int]:Bool]()
    let row = heights.endIndex
    let col = heights[0].endIndex
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
    
    func dfsPacific(_ x:Int,_ y:Int, _ val: Int) -> Bool {
        if x < 0 || y < 0 || x == row || y == col || heights[x][y] > val || visited[x][y] {
            return false
        }
        if x == 0 || y == 0 {return true}
        visited[x][y] = true
        var able = dfsPacific(x+1,y,heights[x][y]) ||
            dfsPacific(x-1,y,heights[x][y]) ||
            dfsPacific(x,y+1,heights[x][y]) ||
            dfsPacific(x,y-1,heights[x][y])
        visited[x][y] = false
        return able
    }
    
    func dfsAtlantic(_ x:Int,_ y:Int, _ val: Int) -> Bool { 
        if x < 0 || y < 0 || x == row || y == col || heights[x][y] > val || visited[x][y] {
            return false
        }
        if x == row - 1 || y == col - 1 {return true}
        visited[x][y] = true
        
        var able = dfsAtlantic(x+1,y,heights[x][y]) ||
            dfsAtlantic(x-1,y,heights[x][y]) ||
            dfsAtlantic(x,y+1,heights[x][y]) ||
            dfsAtlantic(x,y-1,heights[x][y])
        visited[x][y] = false
        
        return able
    }
    
    for i in 0..<row {
        for j in 0..<col {
            dictPacific[[i,j]] = dfsPacific(i,j,Int.max)
            dictAtlantic[[i,j]] = dfsAtlantic(i,j, Int.max)
        }
    }
    for i in 0..<row {
        for j in 0..<col {
            if dictPacific[[i,j]]! && dictAtlantic[[i,j]]! {
                res.append([i,j])
            }
        }
    }
    return res
}

//bottom up O(mn) space O(mn)
class Solution {
    let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        if matrix.count == 0 || matrix[0].count == 0 {
            return [[Int]]()
        }
        
        let n = matrix.count
        let m = matrix[0].count
        var result = [[Int]]()
        var pacific = [[Bool]](repeatElement([Bool](repeatElement(false, count: m)), count: n))
        var atlantic = [[Bool]](repeatElement([Bool](repeatElement(false, count: m)), count: n))
        
        for i in 0..<n {
            DFS(matrix, Int.min, i, 0, &pacific)
            DFS(matrix, Int.min, i, m - 1, &atlantic)
        }
        for i in 0..<m {
            DFS(matrix, Int.min, 0, i, &pacific)
            DFS(matrix, Int.min, n - 1, i, &atlantic)
        }
        for i in 0..<n {
            for j in 0..<m {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i, j])
                }
            }
        }
        
        return result
    }
    
    private func DFS(_ matrix: [[Int]], _ height: Int, _ x: Int, _ y: Int, _ visited: inout [[Bool]]) {
        let n = matrix.count
        let m = matrix[0].count
        if x < 0 || x >= n || y < 0 || y >= m || visited[x][y] || matrix[x][y] < height {
            return
        }
        visited[x][y] = true
        for direction in self.directions {
            DFS(matrix, matrix[x][y], x + direction[0], y + direction[1], &visited)
        }
    }
}

//bottom up O(mn) space O(mn)
func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let row = heights.endIndex
    let col = heights[0].endIndex
    var pacific = [[Bool]](repeating:[Bool](repeating:false,count:col),count: row)
    var atlantic = [[Bool]](repeating:[Bool](repeating:false,count:col),count: row)
    
    func dfs(_ x:Int,_ y:Int,_ val:Int, _ visited: inout [[Bool]]) {
        if x < 0 || y < 0 || x == row || y == col || val > heights[x][y] || visited[x][y] {return}
        visited[x][y] = true
        dfs(x+1,y,heights[x][y],&visited)
        dfs(x-1,y,heights[x][y],&visited)
        dfs(x,y+1,heights[x][y],&visited)
        dfs(x,y-1,heights[x][y],&visited)
    }
    
    for i in 0..<col {
        dfs(0,i,Int.min,&pacific)
        dfs(row-1,i,Int.min,&atlantic)
    }
    
    for i in 0..<row {
        dfs(i,0,Int.min,&pacific)
        dfs(i,col-1,Int.min,&atlantic)
    }
    
    var res = [[Int]]()
    
    for i in 0..<row {
        for j in 0..<col {
            if pacific[i][j] && atlantic[i][j] {
                res.append([i,j])
            }
        }
    }
    return res
}
